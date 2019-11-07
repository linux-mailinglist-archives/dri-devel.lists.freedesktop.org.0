Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C374CF254A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 03:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0586EE68;
	Thu,  7 Nov 2019 02:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B43456EE68
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 02:23:44 +0000 (UTC)
X-UUID: fd7dd07191514f529926189334f3507c-20191107
X-UUID: fd7dd07191514f529926189334f3507c-20191107
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1828325904; Thu, 07 Nov 2019 10:23:42 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 10:23:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 7 Nov 2019 10:23:38 +0800
Message-ID: <1573093419.13645.5.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm next for 5.5 - 2
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 7 Nov 2019 10:23:39 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B433D3BD14457E0CC75F95C67EF524B0B9BA6E2DB114DC8B87BA556B409960512000:8
X-MTK: N
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsOgoKVGhpcyByb3VuZCBhZGQgbmV3IGNvbG9yIGZvcm1hdCBzdXBwb3J0
IGFuZCByZWZsZWN0IGZ1bmN0aW9uLgoKUmVnYXJkcywKQ0sKClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQKNjMxMDA1YjI1NWFhYjVmODQ2ZjdjYTAzNjA2NjEzZjg5OGQ3MDIwNzoK
CiAgZHJtL21lZGlhdGVrOiBhZGQgbm9fY2xrIGludG8gZGRwIHByaXZhdGUgZGF0YSAoMjAxOS0x
MC0wOSAxNjo1ODoxMworMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy5n
aXQKdGFncy9tZWRpYXRlay1kcm0tbmV4dC01LjUtMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIGRmNDQ0NDU3NzExODU4ZDM5ODg5NmQ2NzhiZDNjZDdmNDNmMWMxZjU6CgogIGRybS9t
ZWRpYXRlazogU3VwcG9ydCAxODAgZGVncmVlIHJvdGF0aW9uICgyMDE5LTExLTA2IDE2OjAwOjQ1
ICswODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpNZWRpYXRlayBEUk0gbmV4dCBmb3IgTGludXggNS41IC0gMgoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpTZWFuIFBhdWwgKDgpOgogICAgICBkcm0vbWVkaWF0ZWs6IEFkZCBSR0JbQV0gdmFyaWFu
dHMgdG8gcHVibGlzaGVkIHBsYW5lIGZvcm1hdHMKICAgICAgZHJtL21lZGlhdGVrOiBSZWZhY3Rv
ciBwbGFuZSBpbml0CiAgICAgIGRybS9tZWRpYXRlazogQWRkIGhlbHBlciB0byBnZXQgY29tcG9u
ZW50IGZvciBhIHBsYW5lCiAgICAgIGRybS9tZWRpYXRlazogQWRkIHBsdW1iaW5nIGZvciBsYXll
cl9jaGVjayBob29rCiAgICAgIGRybS9tZWRpYXRlazogUGx1bWIgc3VwcG9ydGVkIHJvdGF0aW9u
IHZhbHVlcyBmcm9tIGNvbXBvbmVudHMgdG8KcGxhbmUgaW5pdAogICAgICBkcm0vbWVkaWF0ZWs6
IFN1cHBvcnQgcmVmbGVjdC15IHBsYW5lIHJvdGF0aW9uCiAgICAgIGRybS9tZWRpYXRlazogU3Vw
cG9ydCByZWZsZWN0LXggcGxhbmUgcm90YXRpb24KICAgICAgZHJtL21lZGlhdGVrOiBTdXBwb3J0
IDE4MCBkZWdyZWUgcm90YXRpb24KCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgICAgIHwgIDUwICsrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYyAgICAgfCAxNDUKKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAgMiArCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgIDIyICsrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgIHwgIDI0ICsrKystCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5oICAgIHwgICA0ICstCiA2IGZpbGVzIGNoYW5n
ZWQsIDIwNSBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
