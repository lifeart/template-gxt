import { module, test } from 'qunit';
import { render, rerender } from '@lifeart/gxt/test-utils';
import { cell } from '@lifeart/gxt';
import { Input } from '@/components/Input';

module('Integration | Component | Input', function () {
  test('it renders with initial value', async function (assert) {
    const initialValue = 'Hello';
    await render(<template><Input @value={{initialValue}} /></template>);
    assert.dom('input').hasValue(initialValue);
  });

  test('it updates value when bound to a cell', async function (assert) {
    const value = cell('World');
    await render(<template><Input @value={{value}} /></template>);
    assert.dom('input').hasValue('World');

    value.update('GlimmerNext');
    await rerender();
    assert.dom('input').hasValue('GlimmerNext');
  });

  test('it accepts additional attributes', async function (assert) {
    await render(
      <template><Input @value={{'Test'}} data-test-id='my-input' /></template>,
    );
    assert.dom('input').hasAttribute('data-test-id', 'my-input');
  });
});
