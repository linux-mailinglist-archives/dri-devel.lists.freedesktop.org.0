Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9E6508EC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BA510E213;
	Mon, 19 Dec 2022 08:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30F210E213
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:53:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BtY-0007Vp-D0; Mon, 19 Dec 2022 09:53:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BtW-000IAc-7a; Mon, 19 Dec 2022 09:53:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p7BtV-006Gr7-Iy; Mon, 19 Dec 2022 09:53:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>
Subject: [PATCH] MAINTAINERS: drm/hisilicon: Drop Chen Feng
Date: Mon, 19 Dec 2022 09:53:07 +0100
Message-Id: <20221219085307.1403247-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=z2KynycVIX7YmRO3uRwOqo1O4/SJHIqRzoo7PZ2ud1s=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjoCZvYxfdznOQShcZFcHn4fMZqgIg0TO2GBepQGPx
 h98oZJGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY6AmbwAKCRDB/BR4rcrsCQm1B/
 9oHfC2BSq9NECuh4FRdvIbAN2ZRaW0QDQu1KLa/IUYqqQHX05KJkzWluea3EkQn6t1kC2FA2YbsH+G
 kQD2Pbg/qWkBoy1jjnf8vRs/tHfi751WnFR+wlmgtkEnDm/N31yEVT7dmfHu0pnt0gvOAeDNzeeq0p
 D3O+0oP+j5pFVcZMMwpar1nQwwh139QClFJ7UYemapMdWdnv1H+fzge6vyL3uUyMWpwuG355VQ4Dav
 mW6BG3/RvoT5FCaB6hlqjTEMxgKDOvh8/NByk5qxMwcOvu0+NNgwOWtNYiR40cfF4sK1w0zoj5CAmh
 +PjLC+Lkzeu3+nts6crfnknjqEsqWw
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The listed address doesn't work any more:

  puck.chen@hisilicon.com
    host mx5.hisilicon.com [124.71.93.234]
    SMTP error from remote mail server after RCPT TO:<puck.chen@hisilicon.com>:
    551 5.1.1 <puck.chen@hisilicon.com>: Recipient address rejected:
    Failed recipient validation check.: host 127.0.0.1[127.0.0.1] said:
    554 5.7.1 recipient verify from ldap failed (in reply to RCPT TO command)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30e032abd196..d693d77e715f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7009,7 +7009,6 @@ M:	Xinliang Liu <xinliang.liu@linaro.org>
 M:	Tian Tao  <tiantao6@hisilicon.com>
 R:	John Stultz <jstultz@google.com>
 R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
-R:	Chen Feng <puck.chen@hisilicon.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.38.1

