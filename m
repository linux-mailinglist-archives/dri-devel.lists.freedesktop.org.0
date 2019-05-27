Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7182B99B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 19:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA0C89700;
	Mon, 27 May 2019 17:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4A89700
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 17:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 57FB6FB03;
 Mon, 27 May 2019 19:54:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqU73AP9fx34; Mon, 27 May 2019 19:54:27 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5432847516; Mon, 27 May 2019 19:54:27 +0200 (CEST)
Date: Mon, 27 May 2019 19:54:27 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller support
Message-ID: <20190527175427.GA788@bogon.m.sigxcpu.org>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558964213.4039.2.camel@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCk9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDAzOjM2OjUzUE0gKzAyMDAsIEx1Y2Fz
IFN0YWNoIHdyb3RlOgo+IEFtIE1pdHR3b2NoLCBkZW4gMDguMDUuMjAxOSwgMTk6MTggKzAyMDAg
c2NocmllYiBHdWlkbyBHw7xudGhlcjoKPiA+IEhpLAo+ID4gT24gVGh1LCBNYXIgMDcsIDIwMTkg
YXQgMTE6MzA6NTFBTSArMDEwMCwgR3VpZG8gR8O8bnRoZXIgd3JvdGU6Cj4gPiA+IFRoaXMgYWRk
cyBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBOV0wgTUlQSSBEU0kgSG9zdCBjb250cm9sbGVyIGZv
dW5kIG9uIGkuTVg4Cj4gPiA+IFNvQ3MuCj4gPiA+IAo+ID4gPiBJdCBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBpLk1YOE1RIGJ1dCB0aGUgc2FtZSBJUCBjb3JlIGNhbiBhbHNvIGJlIGZvdW5kIG9uIGUu
Zy4KPiA+ID4gaS5NWDhRWFAuIEkgYWRkZWQgdGhlIG5lY2Vzc2FyeSBob29rcyB0byBzdXBwb3J0
IG90aGVyIGlteDggdmFyaWFudHMgYnV0IHNpbmNlCj4gPiA+IEkgb25seSBoYXZlIGlteDhtcSBi
b2FyZHMgdG8gdGVzdCBJIG9taXR0ZWQgdGhlIHBsYXRmb3JtIGRhdGEgZm9yIG90aGVyIFNvQ3Mu
Cj4gPiA+IAo+ID4gPiBUaGUgY29kZSBpcyBiYXNlZCBvbiBOWFBzIEJTUCBzbyBJIGFkZGVkIFJv
YmVydCBDaGlyYXMgYXMgQ28tYXV0aG9yZWQtYnkgYnV0Cj4gPiA+IEknbSBoYXBweSB0byBzd2Fw
IEF1dGhvcjogYW5kIENvLWF1dGhvcmVkLWJ5OiBpZiB0aGF0IGxvb2tzIG1vcmUgYXBwcm9wcmlh
dGUuCj4gPiA+IFRoZSBtb3N0IG5vdGFibGUgY2hhbmdlcyBvdmVyIHRoZSBCU1AgZHJpdmVyIGFy
ZQo+ID4gPiDCoC0gQ2FsY3VsYXRlIEhTIG1vZGUgdGltaW5nIGZyb20gcGh5X2NvbmZpZ3VyZV9v
cHRzX21pcGlfZHBoeQo+ID4gPiDCoC0gUGVyZm9ybSBhbGwgY2xvY2sgc2V0dXAgdmlhIERUCj4g
PiA+IMKgLSBNZXJnZSBud2wtaW14IGFuZCBud2wgZHJpdmVycwo+ID4gPiDCoC0gQWRkIEIwIHNp
bGlvbiByZXZpc2lvbiBxdWlyawo+ID4gPiAKPiA+ID4gUG9zdGluZyB0aGlzIGlzIGxpa2VseSBh
IGJpdCBwcmVtYXR1cmUgKGhlbmNlIHYwKSBidXQgSSB3YW50ZWQgZm9yIG9uZSBzaG93IGhvdwo+
ID4gPiB0aGlzIGhvb2tzIGludG8gdGhlIG1peGVsIGRwaHkgcG9zdGVkIGVhcmxpZXIgWzFdIGFu
ZCBhdm9pZCBkdXBsaWNhdGluZyB3b3JrLgo+ID4gPiBTbyBpZiB0aGVyZSdzIG90aGVyIGNvZGUg
b3V0IHRoZXJlIGRvaW5nIHRoZSBzYW1lIEknbSBiZSBoYXBweSB0byBtZXJnZQo+ID4gPiBlZmZv
cnRzLgo+ID4gCj4gPiBTaW5jZSB0aGlzIGlzIGxpa2VseSBub3QgZ29pbmcgYW55d2hlcmUgdW50
aWwgd2UgaGF2ZSBhIGRjc3MgZHJpdmVyIGFpbWVkCj4gPiBmb3IgbWFpbmxpbmUgSSdtIG5vdCBn
b2luZyBzcGFtIHRoZSBsaXN0IHdpdGggZnVydGhlciByZXZpc2lvbnMuIEhvd2V2ZXIKPiA+IHRo
ZSA1LnggdmVyc2lvbiBpcyBtYWludGFpbmVkIGhlcmU6Cj4gPiAKPiA+IMKgwqDCoMKgaHR0cHM6
Ly9zb3VyY2UucHVyaS5zbS9ndWlkby5ndW50aGVyL2xpbnV4LWlteDgvdHJlZS9mb3J3YXJkLXVw
c3RyZWFtL25leHQtMjAxOTA1MDYvaW14LW53bC92MS13aXAKPiA+IAo+ID4gRmVlZGJhY2sgaXMg
c3RpbGwgd2VsY29tZS4gSXQnbGwgZXZlbnR1YWxseSBiZSBmb3J3YXJkZWQgdG8gbmV3ZXIKPiA+
IGxpbnV4LW5leHQgdmVyc2lvbnMuCj4gPiAKPiA+IENoYW5nZXMgb3ZlciB0aGUgcG9zdGVkIHZl
cnNpb24gYXJlOgo+ID4gCj4gPiAtIEFkZCBxdWlyayBmb3IgSU1ROE1RIHNpbGljb24gQjAgcmV2
aXNpb24gdG8gbm90IG1lc3Mgd2l0aCB0aGUKPiA+IMKgIHN5c3RlbSByZXNldCBjb250cm9sbGVy
IG9uIHBvd2VyIGRvd24gc2luY2UgZW5hYmxlIHdvbid0IHdvcmsKPiA+IMKgIGFmdGVyd2FyZHMg
b3RoZXJ3aXNlLgo+ID4gLSBEaXNhYmxlIHR4IGVzYyBjbG9jayAqYWZ0ZXIqIHRoZSBwaHkgcG93
ZXIgZG93biB0byB1bmJyZWFrCj4gPiDCoCBkaXNhYmxlL2VuYWJsZSAodW5ibGFuay9ibGFuaykK
PiA+IC0gRHJvcCBkZXZtX2ZyZWVfaXJxKCkgaGFuZGxlZCBieSB0aGUgZGV2aWNlIGRyaXZlciBj
b3JlCj4gPiAtIEFkZCBwb3J0cyB0byBkdCBiaW5kaW5nIGRvY3MKPiA+IC0gU2VsZWN0IEdFTkVS
SUNfUEhZX01JUElfRFBIWSBpbnN0ZWFkIG9mIEdFTkVSSUNfUEhZIGZvcgo+ID4gwqAgcGh5X21p
cGlfZHBoeV9nZXRfZGVmYXVsdF9jb25maWcKPiA+IC0gSW5jbHVkZSBkcm1fcHJpbnQuaCB0byBm
aXggYnVpbGQgb24gbmV4dC0yMDE5MDQwOAo+ID4gLSBEcm9wIHNvbWUgZGVidWdnaW5nIG1lc3Nh
Z2VzCj4gPiAtIE5ld2xpbmUgdGVybWluYXRlIGFsbCBEUk1fIHByaW50b3V0cwo+ID4gCj4gPiBJ
ZiBzb21lYm9keSBpcyB3b3JraW5nIG9uIERDU1Mgc3VwcG9ydCBpdCdkIGJlIGNvb2wgdG8ga25v
dyBzaW5jZSB0aGlzCj4gPiBkcml2ZXIgaXMgY3VycmVudGx5IGEgY29tcG9uZW50IG9mIGlteC1k
aXNwbGF5LXN1YnN5c3RlbSB3aGljaCB3aWxsIG9ubHkKPiA+IHdvcmsgb3V0IGlmIGRjc3MgaXMg
aGFuZGxlZCBsaWtlIHRoaXMgYXMgd2VsbC4KPiAKPiBXZSBoYXZlIGJlZW4gbG9va2luZyBhdCBo
b3cgdG8gc3VwcG9ydCBEQ1NTIGluIG1haW5saW5lIGZvciBhIHdoaWxlLAo+IGJ1dCBtb3N0IG9m
IHRoZSBhY3R1YWwgd29yayBnb3QgcHVzaGVkIGJlaGluZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3Ro
ZXIKPiBwcmlvcml0aWVzLgo+IAo+IE9uZSB0aGluZyBJIGNhbiBjYW4gc2F5IGZvciBjZXJ0YWlu
IGlzIHRoYXQgRENTUyBzaG91bGQgbm90IGJlCj4gaW50ZWdyYXRlZCBpbnRvIGlteC1kcm0uIEl0
J3MgYSB0b3RhbGx5IGRpZmZlcmVudCBoYXJkd2FyZSBhbmQKPiBkb3duc3RyZWFtIGNsZWFybHkg
c2hvd3MgdGhhdCBpdCdzIG5vdCBhIGdvb2QgaWRlYSB0byBjcmFtIGl0IGludG8gaW14LQo+IGRy
bS4KPiAKPiBBbHNvIHRoZSBhcnRpZmljaWFsIHNwbGl0IGJldHdlZW4gaGFyZHdhcmUgY29udHJv
bCBpbgo+IGRyaXZlcnMvZ3B1L2lteC9kY3NzIGFuZCB0aGUgRFJNIGRyaXZlciBpcyBqdXN0IGNh
cmdvLWN1bHQgZnJvbSB0aGUKPiBJUFUvaW14LWRybSBzcGxpdC4gRm9yIHRoZSBJUFUgd2UgZGlk
IGl0IGFzIHRoZSBJUFUgaGFzIGxlZ3MgaW4gYm90aAo+IERSTSBmb3IgdGhlIG91dHB1dCBwYXJ0
cyBhbmQgVjRMMiBmb3IgdGhlIGlucHV0IHBhcnRzLiBBcyB0aGUgRENTUyBoYXMKPiBubyB2aWRl
byBpbnB1dCBjYXBhYmlsaXRpZXMgdGhlIGRyaXZlciBjb3VsZCBiZSBzaW1wbGlmaWVkIGEgbG90
IGJ5Cj4gbW92aW5nIGl0IGFsbCBpbnRvIGEgc2luZ2xlIERSTSBkcml2ZXIuCgpJIGFncmVlLiBX
aGlsZSBtb3ZpbmcgaWYgZm9yd2FyZCBmcm9tIE5YUHMgdHJlZSB0aGlzIGNhdXNlZCBtb3JlIHRy
b3VibGUKdGhhbiBnb29kIHNvIGxldCdzIGtlZXAgaXQgc2VwYXJhdGUgZm9ybSBpbXgtZHJtLgpD
aGVlcnMsCiAtLSBHdWlkbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
