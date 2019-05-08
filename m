Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDADD185F1
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EABE89893;
	Thu,  9 May 2019 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED098892C0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 09:39:35 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 08 May 2019 17:39:34 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id x489dVGb055126;
 Wed, 8 May 2019 17:39:31 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 8 May 2019 17:39:32 +0800
From: allen <allen.chen@ite.com.tw>
To: <allen.chen@ite.com.tw>
Subject: [PATCH 0/3] IT6505 cover letter
Date: Wed, 8 May 2019 17:31:55 +0800
Message-ID: <1557307985-21228-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw x489dVGb055126
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Ben Whitten <ben.whitten@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 open list <linux-kernel@vger.kernel.org>, Amithash Prasad <amithash@fb.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Johan Hovold <johan@kernel.org>, Nickey Yang <nickey.yang@rock-chips.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Thierry Reding <treding@nvidia.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIElUNjUwNSBpcyBhIGhpZ2gtcGVyZm9ybWFuY2UgRGlzcGxheVBvcnQgMS4xYSB0cmFuc21p
dHRlciwgZnVsbHkgY29tcGxpYW50IHdpdGggRGlzcGxheVBvcnQgMS4xYSwgSERDUCAxLjMgc3Bl
Y2lmaWNhdGlvbnMuIFRoZSBJVDY1MDUgc3VwcG9ydHMgY29sb3IgZGVwdGggb2YgdXAgdG8gMzYg
Yml0cyAoMTIgYml0cy9jb2xvcikgYW5kIGVuc3VyZXMgcm9idXN0IHRyYW5zbWlzc2lvbiBvZiBo
aWdoLXF1YWxpdHkgdW5jb21wcmVzc2VkIHZpZGVvIGNvbnRlbnQsIGFsb25nIHdpdGggdW5jb21w
cmVzc2VkIGFuZCBjb21wcmVzc2VkIGRpZ2l0YWwgYXVkaW8gY29udGVudC4KClRoaXMgc2VyaWVz
IGNvbnRhaW5zIGRvY3VtZW50IGJpbmRpbmdzLCBLY29uZmlnIHRvIGNvbnRyb2wgdGhlIGZ1bmN0
aW9uIGVuYWJsZSBvciBub3QuCgpBbGxlbiBDaGVuICgzKToKICBkdC1iaW5kaW5nczogQWRkIGJp
bmRpbmcgZm9yIElUNjUwNS4KICBkcm0vYnJpZGdlOiBhZGQgaXQ2NTA1IGRyaXZlcgogIGRybS9i
cmlkZ2U6IGl0NjUwNSBkcml2ZXIgYWRkIGNoYXIgZGV2aWNlIGZlYXR1cmUuCgogLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0ICAgICAgICAgfCAgIDMwICsKIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgICAgICAgIHwgICAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgMjIg
KwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAg
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jICAgICAgICAgICAgICAg
IHwgMjc2OCArKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAyODIyIGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYwoKLS0gCjEuOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
