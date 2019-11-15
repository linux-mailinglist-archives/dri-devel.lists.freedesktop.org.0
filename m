Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73AFDB3C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 11:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7E06E40F;
	Fri, 15 Nov 2019 10:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CC2989E7C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 10:08:03 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 Nov 2019 18:04:44 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id xAFA4gwv031714;
 Fri, 15 Nov 2019 18:04:42 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 15 Nov 2019 18:04:42 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v4 0/4] IT6505 cover letter
Date: Fri, 15 Nov 2019 17:52:16 +0800
Message-ID: <1573811564-320-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xAFA4gwv031714
X-Mailman-Approved-At: Fri, 15 Nov 2019 10:23:15 +0000
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM
 DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVERS FOR
 NVIDIA TEGRA" <linux-tegra@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Shawn Guo <shawnguo@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
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
IGNvbnRhaW5zIGRvY3VtZW50IGJpbmRpbmdzLCByZXZlcnQgY29tbWl0LCBhZGQgdmVuZG9yIHBy
ZWZpeCwgS2NvbmZpZyB0byBjb250cm9sIHRoZSBmdW5jdGlvbiBlbmFibGUgb3Igbm90LgoKQWxs
ZW4gQ2hlbiAoMik6CiAgZHQtYmluZGluZ3M6IEFkZCBiaW5kaW5nIGZvciBJVDY1MDUuCiAgZHJt
L2JyaWRnZTogYWRkIGl0NjUwNSBkcml2ZXIKCmFsbGVuICgyKToKICBkdC1iaW5kaW5nczogQWRk
IHZlbmRvciBwcmVmaXggZm9yIElURSBUZWNoLiBJbmMuCiAgUmV2ZXJ0ICJkcm0vdGVncmE6IE1v
dmUgZHJtX2RwX2xpbmsgaGVscGVycyB0byBUZWdyYSBEUk0iCgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0ICAgICAgICAgfCAgIDI4ICsKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICAgICAgIHwgICAgMiArCiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKwogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jICAgICAgICAgICAgICAgIHwgMjY5NyAr
KysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyAgICAg
ICAgICAgICAgICAgICAgfCAgMTI4ICsKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA4NzYgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RwLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTc3IC0tCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHBhdXguYyAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgLQogZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL3Nvci5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxIC0KIGluY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxNiArCiAx
MiBmaWxlcyBjaGFuZ2VkLCAyODc5IGluc2VydGlvbnMoKyksIDEwNTYgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2l0ZSxpdDY1MDUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHAuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
cC5oCgotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
