import { Table } from "antd";
import LoadingComponent from "../LoadingComponent/LoadingComponent";
import ButtonComponent from "../ButtonComponent/ButtonComponent";
import { useRef, useState } from "react";

const TableComponent = (props) => {
  const [isSelectedRowKeys, setIsSelectedRowKeys] = useState([]);
  const {
    selectionType = "checkbox",
    isLoading = false,
    columns = [],
    data: dataSource = [],
    handleDelete,
  } = props;

  const newColumns = () => {
    const filter = columns?.filter((col) => col.dataIndex !== "action");
    return filter;
  };

  const rowSelection = {
    onChange: (selectedRowKeys, selectedRows) => {
      setIsSelectedRowKeys(selectedRowKeys);
    },
    getCheckboxProps: (record) => ({
      disabled: record.name === "Disabled User",
      // Column configuration not to be checked
      name: record.name,
    }),
  };

  const handleDeleteMany = () => {
    handleDelete(isSelectedRowKeys);
  };

  const tableRef = useRef(null);

  return (
    <LoadingComponent isLoading={isLoading}>
      {/* <div style={{ display: "flex", gap: "20px" }}>
        {isSelectedRowKeys.length > 0 && (
          <ButtonComponent
            buttonText="Xóa tất cả"
            styleButton={{
              backgroundColor: "#fff",
              marginBottom: "20px",
              color: "#007fff",
              border: "1px solid #007fff",
              fontWeight: 600,
            }}
            size="large"
            className="wrapper-button"
            onClick={handleDeleteMany}
          />
        )}

        <ButtonComponent
          onClick={() => {}}
          buttonText="Export Excel"
          size="large"
          styleButton={{
            backgroundColor: "#fff",
            marginBottom: "20px",
            color: "#007fff",
            border: "1px solid #007fff",
            fontWeight: 600,
          }}
        />
      </div> */}

      <Table
        ref={tableRef}
        // rowSelection={{
        //   type: selectionType,
        //   ...rowSelection,
        // }}
        columns={columns}
        dataSource={dataSource}
        {...props}
      />
    </LoadingComponent>
  );
};

export default TableComponent;
