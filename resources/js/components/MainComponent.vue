<template>
  <div class="p-4">
    <div class="row">
      <div class="row-draggable-blok">
        <div
          v-for="(col, index) in data"
          :key="col.name + index"
          class="draggable-component"
        >
          <div class="col-title-block">
            <div class="col-title">
              <div
                v-if="col.showInput === false"
                class="nameColumn"
                @dblclick="openInputToEditColumnName(index)"
              >
                {{ col.name }} ({{ col.cards.length }})<span class="pencil-edit"
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    fill="currentColor"
                    class="bi bi-pen"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"
                    /></svg
                ></span>
              </div>
              <div v-else>
                <input
                  v-model="col.Newname"
                  class="editable-input-name"
                  @keydown="handleClickChangeColumnName($event, col, index)"
                />
                <svg
                  @click="col.showInput = false"
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-x"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"
                  />
                </svg>
              </div>
              <div class="btn-group">
                <button
                  class="btn btn-secondary btn-details-column"
                  type="button"
                  data-bs-toggle="dropdown"
                  data-bs-auto-close="true"
                  aria-expanded="false"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    fill="currentColor"
                    class="bi bi-three-dots"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"
                    />
                  </svg>
                </button>
                <ul class="dropdown-menu">
                  <li>
                    <a
                      class="dropdown-item"
                      href="#"
                      @click="handleClickDeleteColumn(col)"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-trash"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"
                        />
                        <path
                          fill-rule="evenodd"
                          d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"
                        />
                      </svg>
                      <div class="ml-2">Delete column</div></a
                    >
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <draggable
            class="draggable-list"
            :list="col.cards"
            v-model="col.cards"
            :animation="200"
            @end="updateListSortOrder"
            :id="col.id"
            ghost-class="ghost-card"
            group="cards"
          >
            <div
              class="list-item"
              v-for="(card, cardIbdex) in col.cards"
              :key="card.order + index"
              @click="handleClickCard(col, card, index, cardIbdex)"
            >
              <div class="pencil-edit-card">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-pen"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"
                  />
                </svg>
              </div>
              {{ card.name }}
            </div>
          </draggable>
          <div
            v-if="col.loading"
            class="progress"
            role="progressbar"
            aria-label="Animated striped example  "
            aria-valuenow="100"
            aria-valuemin="0"
            aria-valuemax="100"
          >
            <div
              class="
                progress-bar progress-bar-striped progress-bar-animated
                bg-info
              "
              style="width: 100%"
            ></div>
          </div>
          <add-column
            title="Card"
            placeholder="Card title ..."
            @handleAddEvent="handleClickAddNewCard($event, col, index)"
          />
        </div>
        <add-column
          title="Column"
          placeholder="Column title ..."
          @handleAddEvent="handleClickAddNewColumn"
        />
      </div>
      <a
        class="btn btn-secondary export-button d-flex justify-content-between"
        type="button"
        href="/export"
      >
        <div>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-database-down"
            viewBox="0 0 16 16"
          >
            <path
              d="M12.5 9a3.5 3.5 0 1 1 0 7 3.5 3.5 0 0 1 0-7Zm.354 5.854 1.5-1.5a.5.5 0 0 0-.708-.708l-.646.647V10.5a.5.5 0 0 0-1 0v2.793l-.646-.647a.5.5 0 0 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0Z"
            />
            <path
              d="M12.096 6.223A4.92 4.92 0 0 0 13 5.698V7c0 .289-.213.654-.753 1.007a4.493 4.493 0 0 1 1.753.25V4c0-1.007-.875-1.755-1.904-2.223C11.022 1.289 9.573 1 8 1s-3.022.289-4.096.777C2.875 2.245 2 2.993 2 4v9c0 1.007.875 1.755 1.904 2.223C4.978 15.71 6.427 16 8 16c.536 0 1.058-.034 1.555-.097a4.525 4.525 0 0 1-.813-.927C8.5 14.992 8.252 15 8 15c-1.464 0-2.766-.27-3.682-.687C3.356 13.875 3 13.373 3 13v-1.302c.271.202.58.378.904.525C4.978 12.71 6.427 13 8 13h.027a4.552 4.552 0 0 1 0-1H8c-1.464 0-2.766-.27-3.682-.687C3.356 10.875 3 10.373 3 10V8.698c.271.202.58.378.904.525C4.978 9.71 6.427 10 8 10c.262 0 .52-.008.774-.024a4.525 4.525 0 0 1 1.102-1.132C9.298 8.944 8.666 9 8 9c-1.464 0-2.766-.27-3.682-.687C3.356 7.875 3 7.373 3 7V5.698c.271.202.58.378.904.525C4.978 6.711 6.427 7 8 7s3.022-.289 4.096-.777ZM3 4c0-.374.356-.875 1.318-1.313C5.234 2.271 6.536 2 8 2s2.766.27 3.682.687C12.644 3.125 13 3.627 13 4c0 .374-.356.875-1.318 1.313C10.766 5.729 9.464 6 8 6s-2.766-.27-3.682-.687C3.356 4.875 3 4.373 3 4Z"
            />
          </svg>
        </div>
        <div>Export BD</div>
      </a>
      <div
        class="modal"
        tabindex="-1"
        id="toggleMyModal"
        :class="{ 'd-block': showUpdateModal }"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Update Card</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
                @click="showUpdateModal = false"
              ></button>
            </div>
            <div
              class="modal-body"
              v-if="cardToEdit && cardToEdit.card != null"
            >
              <form>
                <div class="mb-3">
                  <label for="card-name" class="col-form-label">Name:</label>
                  <input
                    type="text"
                    class="form-control"
                    id="card-name"
                    v-model="cardToEdit.card.name"
                  />
                </div>
                <div class="mb-3">
                  <label for="description-text" class="col-form-label"
                    >Description:</label
                  >
                  <textarea
                    class="form-control"
                    id="description-text"
                    v-model="cardToEdit.card.description"
                  ></textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-danger"
                @click="handleClickDeleteCrd"
              >
                Delete card
                <span
                  v-if="lodingDeleteCard"
                  class="spinner-border spinner-border-sm"
                  role="status"
                  aria-hidden="true"
                  :disabled="lodingDeleteCard"
                ></span>
              </button>

              <button
                type="button"
                class="btn btn-primary"
                @click="handleClickSaveChangeCard"
                :disabled="lodingUpdateCard"
              >
                Save changes
                <span
                  v-if="lodingUpdateCard"
                  class="spinner-border spinner-border-sm"
                  role="status"
                  aria-hidden="true"
                ></span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import draggable from "vuedraggable";
import addColumn from "./addColumn.vue";

export default {
  data() {
    return {
      data: [],
      cardToEdit: null,
      showUpdateModal: false,
      lodingUpdateCard: false,
      lodingDeleteCard: false,
    };
  },
  props: {
    error_db: null,
  },
  methods: {
    async updateListSortOrder(evt) {
      if (evt.from.id != evt.to.id) {
        let indexOfTo = this.data.findIndex((i) => i.id == evt.to.id);
        this.data[indexOfTo].cards.forEach((element, i) => {
          this.data[indexOfTo].cards[i].order = i + 1;
        });
      }
      let indexOf = this.data.findIndex((i) => i.id == evt.from.id);
      this.data[indexOf].cards.forEach((element, i) => {
        this.data[indexOf].cards[i].order = i + 1;
      });
      let params = {
        id: evt.item._underlying_vm_.id,
        new_column_id: evt.to.id,
        old_column_id: evt.from.id,
        order: evt.newIndex + 1,
      };
      await axios
        .post("/api/card/move/" + params.id, params)
        .then((response) => {})
        .catch((error) => (this.error = error.response.data.message));
    },

    async handleClickDeleteCrd() {
      this.lodingDeleteCard = true;
      await axios
        .delete("/api/card/" + this.cardToEdit.card.id)
        .then((response) => {
          this.data[this.cardToEdit.indexCol].cards = this.data[
            this.cardToEdit.indexCol
          ].cards.filter((i) => i.id != this.cardToEdit.card.id);
          for (
            let i = this.cardToEdit.cardIbdex;
            i < this.data[this.cardToEdit.indexCol].cards.length;
            i++
          ) {
            this.data[this.cardToEdit.indexCol].cards[i].order =
              this.data[this.cardToEdit.indexCol].cards[i].order - 1;
          }
          this.lodingDeleteCard = false;
          this.showUpdateModal = false;
          this.cardToEdit = null;
        })
        .catch((error) => {
          this.error = error.response.data.message;
          this.lodingDeleteCard = false;
        });
    },
    async handleClickSaveChangeCard() {
      this.lodingUpdateCard = true;
      let params = {
        name: this.cardToEdit.card.name,
        description: this.cardToEdit.card.description,
        column_id: this.cardToEdit.col.id,
      };

      await axios
        .post("/api/card/" + this.cardToEdit.card.id, params)
        .then((response) => {
          this.data[this.cardToEdit.indexCol].cards[this.cardToEdit.cardIbdex] =
            response.data.data;
          this.lodingUpdateCard = false;

          this.showUpdateModal = false;
          this.cardToEdit = null;
        })
        .catch((error) => {
          this.error = error.response.data.message;
          this.lodingUpdateCard = false;
        });
    },
    handleClickCard(col, card, index, cardIbdex) {
      this.cardToEdit = {
        col: col,
        card: { ...card },
        indexCol: index,
        cardIbdex: cardIbdex,
      };
      this.showUpdateModal = true;
    },
    async handleClickDeleteColumn(column) {
      await axios
        .delete("/api/columns/" + column.id)
        .then((response) => {
          this.data = this.data.filter((i) => i.id != column.id);
        })
        .catch((error) => (this.error = error.response.data.message));
    },
    async handleClickChangeColumnName(e, column, index) {
      if (e.code == "Enter") {
        this.error = null;
        let params = { name: column.Newname };
        await axios
          .post("/api/columns/" + column.id, params)
          .then((response) => {
            this.data[index].name = response.data.data.name;
            this.data[index].Newname = response.data.data.name;
            this.data[index].showInput = false;
          })
          .catch((error) => (this.error = error.response.data.message));
      }
    },
    openInputToEditColumnName(index) {
      this.data[index].showInput = true;
    },
    async handleClickAddNewColumn(value) {
      let params = { name: value };
      await axios
        .post("/api/columns", params)
        .then((response) => {
          this.data.push({
            ...response.data.data,
            Newname: response.data.data.name,
            showInput: false,
            loading: false,
          });
          this.error = null;
        })
        .catch((error) => (this.error = error.response.data.message));
    },
    async handleClickAddNewCard(event, col, index) {
      this.data[index].loading = true;
      let params = { name: event, column_id: col.id };
      await axios
        .post("/api/card", params)
        .then((response) => {
          this.data[index].cards.push(response.data.data);
          this.error = null;
          this.data[index].loading = false;
        })
        .catch((error) => {
          this.error = error.response.data.message;
          this.data[index].loading = false;
        });
    },
    async get_columns() {
      await axios
        .get("/api/columns")
        .then(
          (response) =>
            (this.data = response.data.data.map((item) => {
              return {
                ...item,
                Newname: item.name,
                showInput: false,
                loading: false,
              };
            }))
        )
        .catch((error) => (this.error = error.response.data.message));
    },
  },
  mounted() {
    this.get_columns();
  },
  components: {
    draggable,
    addColumn,
  },
};
</script>

<style scoped lang="scss">
.column-body {
  background: rgb(243, 175, 175);
}
.row-draggable-blok {
  display: flex;
}
.draggable-component {
  border-radius: 6px;
  margin-left: 6px;
  margin-right: 6px;
  display: flex;
  flex-direction: column;
  align-self: auto;
  contain: initial;
  flex: 1 1 auto;
  min-width: 270px;
  max-width: 270px;
  background-color: #ebecf0;
  padding: 5px;
}
.draggable-list {
  display: flex;
  flex-direction: column;
  padding: 5px;
  height: calc(100vh - 225px);
  overflow-x: auto;
  &::-webkit-scrollbar {
    width: 7px;
    height: 7px;
  }
  &::-webkit-scrollbar-track {
    box-shadow: inset 0 0 5px #f0eef8;
    border-radius: 10px;
  }
  &::-webkit-scrollbar-thumb {
    background: #1267922e;
    border-radius: 7px;
  }
}
.list-item {
  padding: 5px;
  min-height: 40px;
  height: 40px;
  position: relative;
  margin: 4px 0px;
  display: block;
  max-width: 270px;
  cursor: pointer;
  text-overflow: ellipsis;
  box-sizing: border-box;
  border-radius: 3px;
  box-shadow: var(
    --ds-shadow-raised,
    0 1px 1px rgba(23, 43, 77, 0.2),
    0 0 1px rgba(23, 43, 77, 0.2)
  );
  transition: background-color 140ms ease-in-out 0s, color 140ms ease-in-out 0s;
  background-color: #ffffff;
  white-space: nowrap;
  overflow: hidden;
  .pencil-edit-card {
    display: none;
  }
  &:hover {
    background: #fff2f28a;
    opacity: 0.5;
    .pencil-edit-card {
      display: contents;
      position: relative;
      top: 30px;
      left: 108px;
    }
  }
}
#toggleMyModal {
  background: #000000a6;
}
.col-title-block {
  display: flex;
  margin: 5px;
  .col-title {
    display: flex;
    justify-content: space-between;
    width: 100%;
    margin-top: 5px;
    margin-bottom: 12px;
    color: #000;
    font-weight: 700;
    font-size: 12px;
    .nameColumn {
      display: flex;
      .pencil-edit {
        display: none;
      }
      &:hover {
        .pencil-edit {
          display: block;
          position: relative;
          font-size: 3px;
          margin-left: 5px;
          margin-right: 10px;
        }
      }
    }
    .editable-input-name {
      border: 1px solid #ebebeb;
      border-radius: 6px;
      padding: 0px 4px;
      margin-right: 7px;
      background: #f5f4f4;
      outline: none;
    }
    .btn-details-column {
      background: transparent;
      border: none;
      color: black;
      padding-top: 0px;
      height: 20px;
    }
    .dropdown-item {
      line-height: 16px;
      display: flex;
    }
  }
}
.export-button {
  width: 10%;
  right: 10px;
  position: fixed;
  bottom: 10px;
}
</style>
