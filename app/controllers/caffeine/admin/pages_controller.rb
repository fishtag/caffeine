module Caffeine
  module Admin
    class PagesController < Admin::ApplicationController
      respond_to :html, :json
      respond_to :js, only: :update

      expose(:page, attributes: :page_params, finder: :find_by_slug, model: Caffeine::Page)

      def index
      end

      def show
        redirect_to edit_admin_page_path(id: page.slug)
      end

      def new
        self.page = page.decorate
      end

      def create
        page.save
        respond_with :admin, page
      end

      def edit
        self.page = page.decorate
      end

      def update
        page.save
        respond_with :admin, page
      end

      def destroy
        page.destroy
        respond_with :admin, page
      end

      def test_response
        respond_with do |format|
            result = {
                status: :ok,
                  results: [
                    { date: '01.01.2014',
                        title: 'О компании',
                        link: '#',
                        summary: 'Автономная некоммерческая организация «Центр испытаний и сертификации «Промтехносерт» была создана Решением Государственной корпорации «Ростехнологии» в 2009 году. АО «Концерн Радиоэлектронные технологии» (КРЭТ) является единственным учредителем АНО "Промтехносерт".'
                    },
                    { date: '02.01.2014',
                      title: 'Услуги',
                      link: '#',
                      summary: 'Автономная некоммерческая организация «Центр испытаний и сертификации «Промтехносерт» была создана Решением Государственной корпорации «Ростехнологии» в 2009 году. АО «Концерн Радиоэлектронные технологии» (КРЭТ) является единственным учредителем АНО "Промтехносерт".'
                    },
                    { date: '03.01.2014',
                      title: 'Контактная информация',
                      link: '#',
                      summary: 'Автономная некоммерческая организация «Центр испытаний и сертификации «Промтехносерт» была создана Решением Государственной корпорации «Ростехнологии» в 2009 году. АО «Концерн Радиоэлектронные технологии» (КРЭТ) является единственным учредителем АНО "Промтехносерт".'
                    }
                  ]
                }
            format.json  { render json: result }
        end
      end

      private

      def page_params
        params.require(:page).permit(Caffeine::Page.permitted_attributes)
      end
    end
  end
end
