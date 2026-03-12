# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail ComfyUI-GGUF@1.1.10 --mode remote
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2512112053
RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.3.4
RUN comfy node install --exit-on-fail ComfyUI_Comfyroll_CustomNodes
RUN comfy node install --exit-on-fail RES4LYF
# Note: Skipped unknown_registry custom nodes (MarkdownNote) because they have no aux_id and cannot be resolved automatically

# download models into comfyui
RUN comfy model download --url https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors --relative-path models/loras --filename Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors
RUN comfy model download --url https://huggingface.co/unsloth/Qwen-Image-Edit-2511-GGUF/resolve/main/qwen-image-edit-2511-Q6_K.gguf --relative-path models/diffusion_models --filename qwen-image-edit-2511-Q6_K.gguf
RUN comfy model download --url https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap/resolve/main/bfs_head_v5_2511_merged_version_rank_16_fp16.safetensors --relative-path models/loras --filename bfs_head_v5_2511_merged_version_rank_16_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/text_encoders --filename qwen_2.5_vl_7b_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/mrpxl2/animetarotV51.safetensors/blob/994923e1e9ffbd60e0c1d83cb644037925c0216a/4x_NMKD-Siax_200k.pth --relative-path models/upscale_models --filename 4x_NMKD-Siax_200k.pth
# RUN # Could not find URL for nmkdSiaxCX_200k.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
