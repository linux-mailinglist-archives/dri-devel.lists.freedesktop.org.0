Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD83565C6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 09:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D24889C83;
	Wed,  7 Apr 2021 07:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E083489C83
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 07:50:28 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFc2R3p9rzyNSk;
 Wed,  7 Apr 2021 15:48:15 +0800 (CST)
Received: from [10.67.110.73] (10.67.110.73) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 7 Apr 2021 15:50:19 +0800
Subject: Re: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select
 GPIOLIB
To: Robert Foss <robert.foss@linaro.org>
References: <20210406090733.169989-1-zhangjianhua18@huawei.com>
 <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
From: "zhangjianhua (E)" <zhangjianhua18@huawei.com>
Message-ID: <d9bd5abf-0293-6155-dee0-20199fed1fc0@huawei.com>
Date: Wed, 7 Apr 2021 15:50:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
X-Originating-IP: [10.67.110.73]
X-CFilter-Loop: Reflected
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0CgpZZXMsIHlvdSBhcmUgcmlnaHQsIHRoZXJlIGFyZSBtYW55IGZpbGVzIHJlZmVy
ZW5jZSAKZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKCkgYW5kCgpkZXZtX2dwaW9kX2dldF9vcHRp
b25hbCgpLiBIb3cgYWJvdXQgYWRkIGNvbmZpZyBkZXBlbmRlbmNpZXMgZm9yIGFsbCAKcmVsZWF0
ZWQKCmNvbmZpZ3Mgb3Igb25seSBhZGQgY29uZmlnIGRlcGVuZGVuY2llcyBmb3IgdGhlIHRvcCBs
ZXZlbCBjb25maWc/CgoKQmVzdCByZWdhcmRzCgpaaGFuZyBKaWFuaHVhCgrlnKggMjAyMS80LzYg
MTg6MjEsIFJvYmVydCBGb3NzIOWGmemBkzoKPiBIZXkgWmhhbmcKPgo+IE9uIFR1ZSwgNiBBcHIg
MjAyMSBhdCAxMTowNywgWmhhbmcgSmlhbmh1YSA8emhhbmdqaWFuaHVhMThAaHVhd2VpLmNvbT4g
d3JvdGU6Cj4+IElmIENPTkZJR19EUk1fTE9OVElVTV9MVDg5MTJCPXksIHRoZSBmb2xsb3dpbmcg
ZXJyb3JzIHdpbGwgYmUgc2VlbiB3aGlsZQo+PiBjb21waWxpbmcgbG9udGl1bS1sdDg5MTJiLmMK
Pj4KPj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYzogSW4gZnVuY3Rp
b24KPj4g4oCYbHQ4OTEyX2hhcmRfcG93ZXJfb27igJk6Cj4+IGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvbG9udGl1bS1sdDg5MTJiLmM6MjUyOjI6IGVycm9yOiBpbXBsaWNpdAo+PiBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiDigJhncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXDigJk7IGRpZCB5b3UgbWVh
bgo+PiDigJhncGlvX3NldF92YWx1ZV9jYW5zbGVlcOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4+ICAgIGdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChsdC0+Z3Bf
cmVzZXQsIDApOwo+PiAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gICAgZ3Bpb19zZXRf
dmFsdWVfY2Fuc2xlZXAKPj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIu
YzogSW4gZnVuY3Rpb24g4oCYbHQ4OTEyX3BhcnNlX2R04oCZOgo+PiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jOjYyODoxMzogZXJyb3I6IGltcGxpY2l0Cj4+IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFs4oCZOyBkaWQgeW91
IG1lYW4KPj4g4oCYZGV2bV9ncGlvX3JlcXVlc3Rfb25l4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4gICAgZ3BfcmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRp
b25hbChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9ISUdIKTsKPj4gICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiAgICAgICAgICAgICAgIGRldm1fZ3Bpb19yZXF1ZXN0X29u
ZQo+PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jOjYyODo1MTogZXJy
b3I6IOKAmEdQSU9EX09VVF9ISUdI4oCZCj4+IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmEdQSU9GX0lOSVRfSElHSOKAmT8KPj4gICAgZ3Bf
cmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9I
SUdIKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHUElPRl9JTklUX0hJR0gKPj4KPj4gU2lnbmVkLW9mZi1ieTogWmhh
bmcgSmlhbmh1YSA8emhhbmdqaWFuaHVhMThAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPj4gaW5kZXggZGJhNjJmOTJkMDUx
Li5jYWE5NjU4ZWM5MzMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2Nv
bmZpZwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPj4gQEAgLTY3LDYg
KzY3LDcgQEAgY29uZmlnIERSTV9MT05USVVNX0xUODkxMkIKPj4gICAgICAgICAgc2VsZWN0IERS
TV9QQU5FTF9CUklER0UKPj4gICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4+ICAgICAg
ICAgIHNlbGVjdCBSRUdNQVBfSTJDCj4+ICsgICAgICAgc2VsZWN0IEdQSU9MSUIKPiBUaGlzIGFw
cGVhcnMgbGlrZSB0aGUgcmlnaHQgZml4IGZvciB0aGlzIHByb2JsZW0uIEhvd2V2ZXIsIGEgbnVt
YmVyIG9mCj4gZHJtL2JyaWRnZSBkcml2ZXJzIHNlZW0gdG8gY2FsbCBib3RoIGdwaW9fc2V0X3Zh
bHVlX2NhbnNsZWVwKCkgYW5kCj4gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoKSB3aXRob3V0IGhh
dmluZyB0aGUgR1BJT0xJQiBrY29uZmlnIG9wdGlvbgo+IHNlbGVjdGVkIHNvIHRoaXMgY2FuJ3Qg
YmUgYSBuZXcgaXNzdWUuIE1heWJlIHNvbWUgbW9yZSBpbnZlc3RpZ2F0aW9uCj4gaXMgaW4gb3Jk
ZXIuCj4gLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
