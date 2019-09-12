Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C1DB0940
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD6A6EBD3;
	Thu, 12 Sep 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 081A66E040
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 03:35:20 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 12 Sep 2019 11:35:20 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id x8C3YrQf093368;
 Thu, 12 Sep 2019 11:34:53 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 12 Sep 2019 11:34:52 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v3 0/2] IT6505 cover letter
Date: Thu, 12 Sep 2019 11:32:27 +0800
Message-ID: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw x8C3YrQf093368
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
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
Cc: Maxime Ripard <mripard@kernel.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>,
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
IGNvbnRhaW5zIGRvY3VtZW50IGJpbmRpbmdzLCBLY29uZmlnIHRvIGNvbnRyb2wgdGhlIGZ1bmN0
aW9uIGVuYWJsZSBvciBub3QuCgpBbGxlbiBDaGVuICgyKToKICBXSVA6IGR0LWJpbmRpbmdzOiBB
ZGQgYmluZGluZyBmb3IgSVQ2NTA1LgogIFdJUDogZHJtL2JyaWRnZTogYWRkIGl0NjUwNSBkcml2
ZXIKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS50eHQgICAgICAgICB8
ICAgMjggKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgICAg
ICAgfCAgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgIHwgICAgNyArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMg
ICAgICAgICAgICAgICAgfCAyNTMxICsrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5n
ZWQsIDI1NjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1LnR4dAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jCgotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
