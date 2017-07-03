module Hephaestus
  module Bot
    class Conversions
      
    end

    class Enrichments
      attr_reader :enrichment

      def initialize(enrichment)
        @enrichment = Enrichment.new(enrichment)
      end
    end

    class PdfSettings
      attr_reader :heading

      def initialize(attrs = {})
        @heading = WordHeadingDetection.new(attrs["heading"]) if attrs["heading"] != nil
      end
    end

    class WordSettings
      attr_reader :heading

      def initialize(attrs = {})
        @heading = WordHeadingDetection.new(attrs["heading"]) if attrs["heading"] != nil
      end
    end

    class HtmlSettings
        attr_reader :exclude_tags_completely, :exclude_tags_keep_content, :keep_content, :exclude_content, :keep_tag_attributes, :exclude_tag_attributes

        def initialize(attrs = {})
          @exclude_tags_completely = attrs["exclude_tags_completely"]
          @exclude_tags_keep_content = attrs["exclude_tags_keep_content"]
          @keep_content = XPathPatterns.new(attrs["keep_content"]) if attrs["keep_content"] != nil
          @exclude_content = XPathPatterns.new(attrs["exclude_content"]) if attrs["exclude_content"] != nil
          @keep_tag_attributes = attrs["keep_tag_attributes"]
          @exclude_tag_attributes = attrs["exclude_tag_attributes"]
        end
    end

    class Enrichment
      attr_reader :description, :destination_field, :source_field, :overwrite, :enrichment, :ignore_downstream_errors, :options

      def initialize(attrs = {})
        @description =  attrs["description"]
        @destination_field = attrs["destination_field"]
        @source_field  = attrs["source_field"]
        @overwite = attrs["overwite"]
        @enrichment = attrs["enrichment"]
        @ignore_downstream_errors = attrs["ignore_downstream_errors"]
        @options = EnrichmentOptions.new["options"]
      end
    end

    class PdfHeadingDetection
      attr_reader :fonts

      def initialize(attrs = {})
        @fonts = FontSettings.new(attrs["fonts"]) if attrs["fonts"] != nil
      end
    end

    class WordHeadingDetection
      attr_reader :fonts, :styles

      def initialize(attrs = {})
        @fonts = FontSettings.new(attrs["fonts"]) if attrs["fonts"] != nil
        @styles = WordStyles.new(attrs["styles"]) if attrs["styles"] != nil
      end
    end

    class XPathPatterns
      attr_reader :xpaths

      def initialize(attrs = {})
        @xpaths = attrs["xpaths"]
      end
    end

    class EnrichmentOptions
      attr_reader :extract, :sentiment, :quotations, :show_source_text,
                  :hierarchical_typed_relations, :model, :language

      def initialize(attrs = {})
        @extract = attrs["extract"]
        @sentiment = attrs["sentiment"]
        @quotations = attrs["quotations"]
        @show_source_text = attrs["showSourceText"]
        @hierarchical_typed_relations = attrs["hierarchicalTypedRelations"]
        @model = attrs["model"]
        @language = attrs["language"]
      end
    end

    class FontSettings
      attr_reader :font_settings

      def initialize(font_settings)
        @font_settings = []
        build_font_settings(font_settings)
      end

      def build_font_settings(font_settings)
        font_settings.each do |font_setting|
          @font_settings << FontSetting.new(font_setting)
        end
      end
    end

    class WordStyles
      attr_reader :word_styles

      def initialize(styles)
        @word_styles = []
        build_word_styles(styles)
      end

      def build_word_styles(word_styles)
        word_styles.each do |word_style|
          @word_styles << WordStyles.new(word_style)
        end
      end
    end

    class FontSetting
      attr_reader :level, :min_size, :max_size, :bold, :italic, :name

      def initialize(attrs = {})
        @level = attrs["level"]
        @min_size = attrs["min_size"]
        @max_size = attrs["max_size"]
        @bold = attrs["bold"]
        @italic = attrs["name"]
      end
    end

    class WordStyle
      attr_reader :level, :names

      def initialize(attrs = {})
        @level = attrs["level"]
        @names = attrs["names"]
      end
    end
  end
end
