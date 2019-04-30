Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D482EFE40
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 18:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4106891AC;
	Tue, 30 Apr 2019 16:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA201891AC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 16:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D1245FB03;
 Tue, 30 Apr 2019 18:58:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4ARVJI0QoKf; Tue, 30 Apr 2019 18:58:17 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 15AA24027E; Tue, 30 Apr 2019 18:58:17 +0200 (CEST)
Date: Tue, 30 Apr 2019 18:58:17 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v9 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Message-ID: <20190430165817.GB29626@bogon.m.sigxcpu.org>
References: <cover.1556633413.git.agx@sigxcpu.org>
 <b999b07673e59c676d2e43a786b635beb056e9bf.1556633413.git.agx@sigxcpu.org>
 <CAOMZO5BerzB94YvJgZoOVYaA3fCsHQiuC5FyVVVRV+ttEg92uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5BerzB94YvJgZoOVYaA3fCsHQiuC5FyVVVRV+ttEg92uQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Abel Vesa <abel.vesa@nxp.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFiaW8sCk9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDAxOjI0OjQ1UE0gLTAzMDAsIEZhYmlv
IEVzdGV2YW0gd3JvdGU6Cj4gSGkgR3VpZG8sCj4gCj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQg
MTE6NDAgQU0gR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4gd3JvdGU6Cj4gPgo+ID4g
VGhpcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBNaXhlbCBEUEhZIGFzIGZvdW5kIG9uIGkuTVg4IENQ
VXMgYnV0IHNpbmNlCj4gPiB0aGlzIGlzIGFuIElQIGNvcmUgaXQgd2lsbCBsaWtlbHkgYmUgZm91
bmQgb24gb3RoZXJzIGluIHRoZSBmdXR1cmUuIFNvCj4gPiBpbnN0ZWFkIG9mIGFkZGluZyB0aGlz
IHRvIHRoZSBud2wgaG9zdCBkcml2ZXIgbWFrZSBpdCBhIGdlbmVyaWMgUEhZCj4gPiBkcml2ZXIu
Cj4gPgo+ID4gVGhlIGRyaXZlciBzdXBwb3J0cyB0aGUgaS5NWDhNUS4gU3VwcG9ydCBmb3IgaS5N
WDhRTSBhbmQgaS5NWDhRWFAgY2FuIGJlCj4gPiBhZGRlZCBvbmNlIHRoZSBuZWNlc3Nhcnkgc3lz
dGVtIGNvbnRyb2xsZXIgYml0cyBhcmUgaW4gdmlhCj4gPiBtaXhlbF9kcGh5X2RldmRhdGEuCj4g
Pgo+ID4gQ28tYXV0aG9yZWQtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Cj4g
Cj4gSSB3aXNoIEkgY291bGQgdGVzdCBpdCBvbiBhIGlteDhtLWV2ayAsIGJ1dCB0aGVyZSBhcmUg
c29tZSBvdGhlcgo+IHBpZWNlcyBuZWVkZWQgc3VjaCBhcyBOb3J0aHdlc3QgTG9naWMgZHJpdmVy
LCBteHNmYiBjaGFuZ2VzIGZvcgo+IHN1cHBvcnRpbmcgbXg4bSwgT0xFRCBwYW5lbCBkcml2ZXIs
IGV0Ywo+IAo+IEFueXdheSwgaXQgbG9va3MgZ29vZCB0byBtZSBhbmQgSSBoYXZlIG9ubHkgYSBm
ZXcgbWlub3IgY29tbWVudHM6Cj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJzL3BoeS9mcmVlc2NhbGUv
S2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMTEgKwo+ID4gIGRyaXZlcnMvcGh5L2ZyZWVzY2Fs
ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgLi4uL3BoeS9mcmVlc2NhbGUv
cGh5LWZzbC1pbXg4LW1pcGktZHBoeS5jICAgIHwgNTA2ICsrKysrKysrKysrKysrKysrKwo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgNTE4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9waHkvZnJlZXNjYWxlL3BoeS1mc2wtaW14OC1taXBpLWRwaHkuYwo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9mcmVlc2NhbGUvS2NvbmZpZyBiL2RyaXZlcnMvcGh5
L2ZyZWVzY2FsZS9LY29uZmlnCj4gPiBpbmRleCA4MzI2NzBiNDk1MmIuLmExMTFiMTMwZjlkMiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGh5L2ZyZWVzY2FsZS9LY29uZmlnCj4gPiArKysgYi9k
cml2ZXJzL3BoeS9mcmVlc2NhbGUvS2NvbmZpZwo+ID4gQEAgLTMsMyArMywxNCBAQCBjb25maWcg
UEhZX0ZTTF9JTVg4TVFfVVNCCj4gPiAgICAgICAgIGRlcGVuZHMgb24gT0YgJiYgSEFTX0lPTUVN
Cj4gPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX1BIWQo+ID4gICAgICAgICBkZWZhdWx0IEFSQ0hf
TVhDICYmIEFSTTY0Cj4gPiArCj4gPiArY29uZmlnIFBIWV9NSVhFTF9NSVBJX0RQSFkKPiA+ICsg
ICAgICAgdHJpc3RhdGUgIk1peGVsIE1JUEkgRFNJIFBIWSBzdXBwb3J0Igo+ID4gKyAgICAgICBk
ZXBlbmRzIG9uIE9GICYmIEhBU19JT01FTQo+ID4gKyAgICAgICBzZWxlY3QgR0VORVJJQ19QSFkK
PiA+ICsgICAgICAgc2VsZWN0IEdFTkVSSUNfUEhZX01JUElfRFBIWQo+ID4gKyAgICAgICBzZWxl
Y3QgUkVHTUFQX01NSU8KPiA+ICsgICAgICAgZGVmYXVsdCBBUkNIX01YQyAmJiBBUk02NAo+IAo+
IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGRlZmF1bHQgaXMgYSBnb29kIGlkZWEuCj4gCj4gVGhl
cmUgYXJlIGlteDhtIHN5c3RlbXMgdGhhdCBkbyBub3QgaGF2ZSBkaXNwbGF5LCBzbyBpbiB0aGlz
IGNhc2UgaXQKPiBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIGFsd2F5cyBmb3JjZSB0aGUgYnVpbGQg
b2YgdGhpcyBkcml2ZXIuCgpPLmsuIC0gd2UgY2FuIGVuYWJsZSB0aGlzIGJhc2VkIG9uIGlteC1u
d2wgbGF0ZXIgb24uIEkndmUgYWxzbyBhZGRyZXNzZWQKeW91ciBvdGhlciBjb21tZW50cy4gV2ls
bCB3YWl0IGZvciBhIHYxMCBmb3IgYSBjb3VwbGUgb2YgZGF5cyBpbiBjYXNlCnRoZXJlJ3MgbW9y
ZSBmZWVkYmFjay4KVGhhbmtzLAogLS0gR3VpZG8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
