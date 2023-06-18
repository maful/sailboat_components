# frozen_string_literal: true

require "components/test_helper"

class AvatarTest < Minitest::Test
  include Sailboat::ComponentTestHelpers

  def test_renders
    render_inline(Sailboat::Avatar.new(src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))

    assert_selector("img.avatar")
  end

  def test_defaults_to_size_24
    render_inline(Sailboat::Avatar.new(src: SailboatComponents::ExampleImage::BASE64_SRC, alt: "@username"))

    assert_selector("img.avatar[size=24][height=24][width=24]")
  end

  def test_defaults_to_circle_avatar
    render_inline(Sailboat::Avatar.new(
      shape: :circle,
      src: SailboatComponents::ExampleImage::BASE64_SRC,
      alt: "@username",
    ))

    assert_selector("img.avatar.avatar--circle")
  end

  def test_defaults_to_square_avatar
    render_inline(Sailboat::Avatar.new(
      shape: :square,
      src: SailboatComponents::ExampleImage::BASE64_SRC,
      alt: "@username",
    ))

    assert_selector("img.avatar")
  end

  def test_sets_size_height_and_width
    render_inline(Sailboat::Avatar.new(
      size: 40,
      src: SailboatComponents::ExampleImage::BASE64_SRC,
      alt: "@username",
    ))

    assert_selector("img.avatar[size=40][height=40][width=40]")
  end

  def test_fall_back_when_size_isn_t_valid
    render_inline(Sailboat::Avatar.new(
      size: 1_000,
      src: SailboatComponents::ExampleImage::BASE64_SRC,
      alt: "@username",
    ))

    assert_selector("img.avatar[size=24][height=24][width=24]")
  end
end
