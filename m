Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872910687A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853CE6F4ED;
	Fri, 22 Nov 2019 09:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id C00986E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 18:22:32 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id A48D880DB;
 Thu, 21 Nov 2019 18:23:08 +0000 (UTC)
Date: Thu, 21 Nov 2019 10:22:28 -0800
From: Tony Lindgren <tony@atomide.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191121182228.GO43123@atomide.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-6-jjhiblot@ti.com>
 <20191009193523.GA7094@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009193523.GA7094@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, sre@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoqIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IFs3MDAxMDEgMDA6MDBdOgo+IE9u
IFdlZCwgT2N0IDA5LCAyMDE5IGF0IDEwOjUxOjI2QU0gKzAyMDAsIEplYW4tSmFjcXVlcyBIaWJs
b3Qgd3JvdGU6Cj4gPiBBZGQgRFQgYmluZGluZyBmb3IgbGVkLWJhY2tsaWdodC4KLi4uCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQueWFt
bAouLi4KCj4gPiArICBkZWZhdWx0LWJyaWdodG5lc3M6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBkZXNjcmlwdGlvbjogRGVm
YXVsdCBicmlnaHRuZXNzIGxldmVsIG9uIGJvb3QuCj4gCj4gSXQncyBub3QgY2xlYXIgdGhhdCB0
aGlzIGlzIGFuIGluZGV4IHdoZW4gJ2JyaWdodG5lc3MtbGV2ZWxzJyBpcyBwcmVzZW50IAo+IGFu
ZCBhYnNvbHV0ZSBsZXZlbCB3aGVuIG5vdC4gSSB3b25kZXIgaWYgd2UndmUgYmVlbiBjb25zaXN0
ZW50IG9uIHRoYXQ/CgpZZWFoLi4gQW5kIHNob3VsZCB3ZSB1c2UgImRlZmF1bHQtYnJpZ2h0bmVz
cy1sZXZlbCIgaGVyZSBsaWtlIHdlIGRvCmluIHRoZSBrZXJuZWwgbm93PwoKU29ycnkgaWYgSSd2
ZSBtaXNzZWQgc29tZSBkaXNjdXNzaW9uIG9uIHRoaXMgYmVmb3JlLi4KCj4gPiArICAgICAgYnJp
Z2h0bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1NT47CgpXaGF0IHdlJ3JlIHVz
aW5nIGZvciBkcm9pZDQgd2l0aCBhbiBlYXJsaWVyIHZlcnNpb24gb2YgdGhpcwpwYXRjaCBzZXQg
Zm9yIHRoZSBicmlnaHRuZXNzLWxldmVscyBpcyBnZW5lcmF0ZWQgYmFja3dhcmRzCndpdGg6Cgok
IGZvciBpIGluIDAgMSAyIDMgNCA1IDYgNzsgZG8gZWNobyAiMjU1IC0gJHtpfSAqICgyNTYgLyA4
KSIgfCBiYzsgZG9uZQoKVGhpcyBwcm9kdWNlcyB0aGUgZm9sbG93aW5nIHJhbmdlIHRoYXQgc2Vl
bSB0byBiZWhhdmUgbmljZWx5OgoKYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MzEgNjMgOTUgMTI3IDE1
OSAxOTEgMjIzIDI1NT47CgpPZiBjb3Vyc2UgZGVwZW5kcyBvbiB0aGUgYmFja2luZyBoYXJkd2Fy
ZSwgdGhpcyBpcyB3aXRoCmxlZHNfbG0zNTMyIG9uIGRyb2lkNC4gQnV0IEkgdGhpbmsgYWxzbyB0
aGUgY3VycmVudCBleGFtcGxlCmluIHRoZSBiaW5kaW5nIG1pZ2h0IGJlIGZyb20gUGF2ZWwgYWxz
byBmb3IgZHJvaWQ0PwoKSWYgc28sIHlvdSBtaWdodCB3YW50IHRvIHVwZGF0ZSB0aGUgcmFuZ2Ug
OikKClJlZ2FyZHMsCgpUb255CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
