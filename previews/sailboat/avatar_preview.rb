# frozen_string_literal: true

module Sailboat
  # @label Avatar
  class AvatarPreview < ViewComponent::Preview
    # @label Playground
    #
    # @param size [Integer] select [24, 32, 40, 48, 56, 64]
    # @param shape [Symbol] select [circle, square]
    def playground(shape: :circle, size: 24)
      render(Sailboat::Avatar.new(
        size: size,
        shape: shape,
        src: SailboatComponents::ExampleImage::BASE64_SRC,
        alt: "@username",
      ))
    end

    # @label Default
    def default
      render(Sailboat::Avatar.new(src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @!group Sizes
    #
    # @label 24px
    def size_24
      render(Sailboat::Avatar.new(size: 24, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @label 32px
    def size_32
      render(Sailboat::Avatar.new(size: 32, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @label 40px
    def size_40
      render(Sailboat::Avatar.new(size: 40, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @label 48px
    def size_48
      render(Sailboat::Avatar.new(size: 48, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @label 56px
    def size_56
      render(Sailboat::Avatar.new(size: 56, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @label 64px
    def size_64
      render(Sailboat::Avatar.new(size: 64, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end
    #
    # @!endgroup

    # @!group Shape
    #
    # @label Circle
    def shape_circle
      render(Sailboat::Avatar.new(shape: :circle, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end

    # @label Square
    def shape_square
      render(Sailboat::Avatar.new(shape: :square, src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))
    end
    #
    # @!endgroup
  end
end
