
#include QMK_KEYBOARD_H


enum planck_layers {
  _QWERTY,
  _COLEMAK,
  _LOWER,
  _RAISE,
  _ADJUST
};

enum planck_keycodes {
  QWERTY = SAFE_RANGE,
  COLEMAK,
  // Custom key functions
  POUND_EURO
};

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  '   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Esc  |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Shift|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      | Ctrl | Alt  |Super |Lower |Space |Enter |Raise | Ctrl | Alt  |Super |      |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_planck_grid(
    KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_QUOT,
    KC_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_BSPC,
    KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,
    _______, KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_ENT,  RAISE,   KC_RCTL, KC_RALT, KC_RGUI, _______
),

/* Colemak
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   Q  |   W  |   F  |   P  |   G  |   J  |   L  |   U  |   Y  |   ;  |  '   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Esc  |   A  |   R  |   S  |   T  |   D  |   H  |   N  |   E  |   I  |   O  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   K  |   M  |   ,  |   .  |   /  | Shift|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      | Ctrl | Alt  |Super |Lower |Space |Enter |Raise | Ctrl | Alt  |Super |      |
 * `-----------------------------------------------------------------------------------'
 */
[_COLEMAK] = LAYOUT_planck_grid(
    KC_TAB,  KC_Q,    KC_W,    KC_F,    KC_P,    KC_G,    KC_J,    KC_L,    KC_U,    KC_Y,    KC_SCLN, KC_QUOT,
    KC_ESC,  KC_A,    KC_R,    KC_S,    KC_T,    KC_D,    KC_H,    KC_N,    KC_E,    KC_I,    KC_O,    KC_BSPC,
    KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_K,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,
    _______, KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_ENT,  RAISE,   KC_RCTL, KC_RALT, KC_RGUI, _______
),

/* Lower (Symbols)
 * ,-----------------------------------------------------------------------------------.
 * |      |   7  |   5  |   3  |   1  |   9  |   8  |   0  |   2  |   4  |   6  |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |  £€  |   #  |   %  |   !  |  [{  |  }]  |   -  |   _  |   =  |   +  |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |  \|  |   @  |   &  |   $  |   (  |  )   |   *  |   ^  |   `  |   ~  |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_planck_grid(
    _______, KC_7,       KC_5,       KC_3,       KC_1,       KC_9,       KC_8,       KC_0,       KC_2,          KC_4,   KC_6,         _______,
    _______, POUND_EURO, LSFT(KC_3), LSFT(KC_5), LSFT(KC_1), KC_LBRC,    KC_RBRC,    KC_MINS,    LSFT(KC_MINS), KC_EQL, LSFT(KC_EQL), _______,
    _______, KC_BSLS,    LSFT(KC_2), LSFT(KC_7), LSFT(KC_4), LSFT(KC_9), LSFT(KC_0), LSFT(KC_8), LSFT(KC_6),    KC_GRV, LSFT(KC_GRV), _______,
    _______, _______, _______, _______, _______, _______, _______, _______,    _______,    _______, _______, _______
),

/* Raise (Movement)
 * ,-----------------------------------------------------------------------------------.
 * |      |  F1  |  F2  |  F3  |  F4  |      |PrtScr|Pg Dn |Pg Up |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |  F5  |  F6  |  F7  |  F8  |      | Left | Down | Up   |Right |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |  F9  |  F10 |  F11 |  F12 |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = LAYOUT_planck_grid(
    _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   XXXXXXX,  KC_PSCR, KC_PGDN, KC_PGUP, XXXXXXX,  XXXXXXX, _______,
    _______, KC_F5,   KC_F6,   KC_F7,   KC_F8,   XXXXXXX,  KC_LEFT, KC_DOWN, KC_UP,   KC_RIGHT, XXXXXXX, _______,
    _______, KC_F9,   KC_F10,  KC_F11,  KC_F12,  XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
),

/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |      |Reset |Debug |Qwerty|Colemk|      |      |SLEEP |WAKE  |      |POWER |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |RGBTog|RGBMOD| HUE+ | SAT+ |KBBrh+|NextTr|Mute  |Vol + |Brigh+|      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |AUDTog|      | HUE- | SAT- |KBBrh-|PrevTr|Play  |Vol - |Brigh-|      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] = LAYOUT_planck_grid(
    _______, RESET,   DEBUG,   QWERTY,  COLEMAK, XXXXXXX, XXXXXXX, KC_SLEP, KC_WAKE, XXXXXXX, KC_PWR,  _______,
    _______, RGB_TOG, RGB_MOD, RGB_HUI, RGB_SAI, RGB_VAI, KC_MNXT, KC_MUTE, KC_VOLU, KC_BRIU, XXXXXXX, _______,
    _______, AU_TOG,  XXXXXXX, RGB_HUD, RGB_SAD, RGB_VAD, KC_MPRV, KC_MPLY, KC_VOLD, KC_BRID, XXXXXXX, _______,
    _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
)

};

layer_state_t layer_state_set_user(layer_state_t state) {
  return update_tri_layer_state(state, _LOWER, _RAISE, _ADJUST);
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        print("mode just switched to qwerty and this is a huge string\n");
        set_single_persistent_default_layer(_QWERTY);
      }
      return false;
      break;
    case COLEMAK:
      if (record->event.pressed) {
        set_single_persistent_default_layer(_COLEMAK);
      }
      return false;
      break;
    case POUND_EURO:
      if (record->event.pressed) {
        if (get_mods() & MOD_MASK_SHIFT) {
          send_unicode_string("€");
        } else {
          send_unicode_string("£");
        }
      }
      return false;
      break;
  }
  return true;
}

