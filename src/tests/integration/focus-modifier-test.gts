import { module, test } from 'qunit';
import { render } from '@lifeart/gxt/test-utils';
import { autofocus } from '../../modifiers/autofocus';

module('Integration | modifiers | autofocus', function () {
  test('works as expected', async function (assert) {
    await render(<template><input {{autofocus}} /></template>);
    await new Promise((resolve)=> requestAnimationFrame(resolve));
    assert.dom('input').isFocused();
  });
});
