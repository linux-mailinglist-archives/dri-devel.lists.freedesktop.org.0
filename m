Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544216CA9FE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 18:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087210E61E;
	Mon, 27 Mar 2023 16:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E49C10E61E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:08:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgpO1-00087W-AY; Mon, 27 Mar 2023 18:07:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgpO0-0077RX-CK; Mon, 27 Mar 2023 18:07:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgpNz-008Sqd-K2; Mon, 27 Mar 2023 18:07:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amd/display: Whitespace cleanup
Date: Mon, 27 Mar 2023 18:07:54 +0200
Message-Id: <20230327160754.772302-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4950;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nMqUkJb/didxEjphbfEWiUnQJ0w8k8CTikmn712Qjeo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIb9XexY2NgwXBljrk/WdNz25GG48bFfO9rzxD
 LcT6ylve2mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCG/VwAKCRCPgPtYfRL+
 Tkq6B/47kjPVsvkV28rqy0/Q+bvPXH/ZsIPZMFg+CL/+R8x3qzKUv62rslaiQylKVzMIOq6ILWn
 g3ZXIyTWoYlIYuzwAiPYcT0VT2AQyWMPPAiAhHAcGDEXZDZzhpiWRdGRyxZwVYmX9NHGIwh1Fdg
 RtK68P9TM8/c9ICRe0ny4TjHOFELGrGGQ/8idtRiD/VfRgo4PpQxVkobX2S6WAnNdi6lQ+F9n9u
 gKuecaYsVcLIf/nF3fgs5QBRsDb81N9uqNN9zUFca1JTXp6Ti4yXLZiBXF85IG/4SYUu79j8n9P
 Sxq7+HSog9MSfuoFnWx6iWl+OtVc3KRv15cr9DgJ+EWUgNMG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 075e2099c32c ("drm/amd/display: Fix race condition in DPIA AUX
transfer") was backported to stable, which I noticed because of git
saying

	linux-6.1/.git/rebase-apply/patch:37154: space before tab in indent.

while applying patch-6.1.21. While fixing the code location that issued
that warning, improve in few more places.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

while reading through the driver I found a few more things that could be
improved. E.g 

| @@ -2625,43 +2625,35 @@ static void emulated_link_detect(struct dc_link *link)
|  		dc_sink_release(prev_sink);
|  
|  	switch (link->connector_signal) {
| -	case SIGNAL_TYPE_HDMI_TYPE_A: {
| +	case SIGNAL_TYPE_HDMI_TYPE_A:
|  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
|  		sink_caps.signal = SIGNAL_TYPE_HDMI_TYPE_A;
|  		break;
| -	}
|  
| -	case SIGNAL_TYPE_DVI_SINGLE_LINK: {
| +	case SIGNAL_TYPE_DVI_SINGLE_LINK:
|  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
|  		sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
|  		break;
| -	}
|  
| -	case SIGNAL_TYPE_DVI_DUAL_LINK: {
| +	case SIGNAL_TYPE_DVI_DUAL_LINK:
|  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
|  		sink_caps.signal = SIGNAL_TYPE_DVI_DUAL_LINK;
|  		break;
| -	}
|  
| -	case SIGNAL_TYPE_LVDS: {
| +	case SIGNAL_TYPE_LVDS:
|  		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
|  		sink_caps.signal = SIGNAL_TYPE_LVDS;
|  		break;
| -	}
|  
| -	case SIGNAL_TYPE_EDP: {
| -		sink_caps.transaction_type =
| -			DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
| +	case SIGNAL_TYPE_EDP:
| +		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
|  		sink_caps.signal = SIGNAL_TYPE_EDP;
|  		break;
| -	}
|  
| -	case SIGNAL_TYPE_DISPLAY_PORT: {
| -		sink_caps.transaction_type =
| -			DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
| +	case SIGNAL_TYPE_DISPLAY_PORT:
| +		sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
|  		sink_caps.signal = SIGNAL_TYPE_VIRTUAL;
|  		break;
| -	}
|  
|  	default:
|  		DC_ERROR("Invalid connector type! signal:%d\n",

(hopefully that is quoted good enough not to be picked up by git)

Best regards
Uwe

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5bac5781a06b..78590e48e8d5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2300,9 +2300,9 @@ static int dm_late_init(void *handle)
 	 */
 	params.min_abm_backlight = 0x28F;
 	/* In the case where abm is implemented on dmcub,
-	* dmcu object will be null.
-	* ABM 2.4 and up are implemented on dmcub.
-	*/
+	 * dmcu object will be null.
+	 * ABM 2.4 and up are implemented on dmcub.
+	 */
 	if (dmcu) {
 		if (!dmcu_load_iram(dmcu, params))
 			return -EINVAL;
@@ -7106,13 +7106,13 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 	/* Standard FPS values
 	 *
 	 * 23.976       - TV/NTSC
-	 * 24 	        - Cinema
-	 * 25 	        - TV/PAL
+	 * 24           - Cinema
+	 * 25           - TV/PAL
 	 * 29.97        - TV/NTSC
-	 * 30 	        - TV/NTSC
-	 * 48 	        - Cinema HFR
-	 * 50 	        - TV/PAL
-	 * 60 	        - Commonly used
+	 * 30           - TV/NTSC
+	 * 48           - Cinema HFR
+	 * 50           - TV/PAL
+	 * 60           - Commonly used
 	 * 48,72,96,120 - Multiples of 24
 	 */
 	static const u32 common_rates[] = {
@@ -7740,7 +7740,7 @@ static void update_freesync_state_on_stream(
 		return;
 
 	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
-        vrr_params = acrtc->dm_irq_params.vrr_params;
+	vrr_params = acrtc->dm_irq_params.vrr_params;
 
 	if (surface) {
 		mod_freesync_handle_preflip(
@@ -8321,7 +8321,7 @@ static void amdgpu_dm_commit_audio(struct drm_device *dev,
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
 
-	notify:
+notify:
 		aconnector = to_amdgpu_dm_connector(connector);
 
 		mutex_lock(&adev->dm.audio_lock);
@@ -9337,7 +9337,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 skip_modeset:
 	/* Release extra reference */
 	if (new_stream)
-		 dc_stream_release(new_stream);
+		dc_stream_release(new_stream);
 
 	/*
 	 * We want to do dc stream updates that do not require a
@@ -10671,7 +10671,7 @@ int amdgpu_dm_process_dmub_aux_transfer_sync(
 	if (!dc_process_dmub_aux_transfer_async(ctx->dc, link_index, payload)) {
 		*operation_result = AUX_RET_ERROR_ENGINE_ACQUIRE;
 		goto out;
- 	}
+	}
 
 	if (!wait_for_completion_timeout(&adev->dm.dmub_aux_transfer_done, 10 * HZ)) {
 		DRM_ERROR("wait_for_completion_timeout timeout!");

base-commit: e5dbf24e8b9e6aa0a185d86ce46a7a9c79ebb40f
-- 
2.39.2

