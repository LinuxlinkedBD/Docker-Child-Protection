import React from "react";
import PropTypes from "prop-types";
import { connect, useSelector } from "react-redux";
import Chip from "@material-ui/core/Chip";
import { makeStyles } from "@material-ui/styles";
import { useI18n } from "components/i18n";
import { getOption } from "components/record-form/selectors";
import { isEmpty } from "lodash";
import styles from "./styles.css";
import * as actions from "./action-creators";
import * as Selectors from "./selectors";

const Chips = ({ recordType, props, chips, setChips }) => {
  const css = makeStyles(styles)();
  const i18n = useI18n();
  const {
    field_name: fieldName,
    options,
    option_strings_source: optionStringsSource
  } = props;
  let values = [];

  values = useSelector(state => getOption(state, optionStringsSource, i18n));

  if (isEmpty(optionStringsSource) && Array.isArray(options)) {
    values = options;
  } else if (Object.keys(values).length <= 0) {
    values = options[i18n.locale];
  }

  return (
    <div className={css.root}>
      {values.map(data => {
        const chipVariant = data.filled ? "default" : "outlined";
        const className = css[[data.css_color, chipVariant].join("-")];
        const cssSelectedChip =
          chips && chips.includes(data.id) ? "chipSelected" : null;

        return (
          // TODO: Reuse DashboardChip Component
          <Chip
            key={data.id}
            size="small"
            label={data.display_name || data.display_text}
            variant={chipVariant}
            onClick={() =>
              setChips(
                { fieldName, data: data.id },
                chips && chips.includes(data.id),
                recordType
              )
            }
            className={[css.chip, className, css[cssSelectedChip]].join(" ")}
            classes={{ clickable: css.testclick }}
          />
        );
      })}
    </div>
  );
};

Chips.propTypes = {
  recordType: PropTypes.string,
  chips: PropTypes.oneOfType([PropTypes.object, PropTypes.array]),
  props: PropTypes.object,
  setChips: PropTypes.func,
  options: PropTypes.object,
  field_name: PropTypes.string,
  option_strings_source: PropTypes.string
};

const mapStateToProps = (state, obj) => ({
  chips: Selectors.getChips(state, obj.props, obj.recordType)
});

const mapDispatchToProps = {
  setChips: actions.setChip
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Chips);
