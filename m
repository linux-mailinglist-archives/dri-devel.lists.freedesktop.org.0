Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A74F84B25
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 14:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B8F6E6B9;
	Wed,  7 Aug 2019 12:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 72060 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2019 12:02:51 UTC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2C86E6B7;
 Wed,  7 Aug 2019 12:02:51 +0000 (UTC)
X-Originating-IP: 88.168.111.231
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3B1731BF20E;
 Wed,  7 Aug 2019 12:02:47 +0000 (UTC)
Date: Wed, 7 Aug 2019 14:02:46 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PULL] drm-misc-next
Message-ID: <20190807120246.tl4hhztr3qna3qf6@flea>
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <20190806160146.sj7l5wrrjtt5nhbz@flea>
 <20190806161132.GC7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806161132.GC7444@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDY6MTE6MzJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwNjowMTo0NlBNICswMjAwLCBNYXhpbWUg
UmlwYXJkIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTA6MzM6NTNBTSArMTAw
MCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPiA+IE9uIFNhdCwgMyBBdWcgMjAxOSBhdCAyMDo0Nywg
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiBIaSBEYW5pZWwsIERhdmUsCj4gPiA+ID4KPiA+ID4gPiBIZXJlIGlzIHRoZSBmaXJz
dCAoYW5kIHByZXR0eSBsYXRlKSBkcm0tbWlzYy1uZXh0IFBSLgo+ID4gPiA+Cj4gPiA+ID4gSXQn
cyBwcmV0dHkgYmlnIGR1ZSB0byB0aGUgbGF0ZW5lc3MsIGJ1dCB0aGVyZSdzIG5vdGhpbmcgcmVh
bGx5IG1ham9yCj4gPiA+ID4gc2hvd2luZyB1cC4gSXQncyBwcmV0dHkgbXVjaCB0aGUgdXN1YWwg
YnVuY2ggb2YgcmV3b3JrcywgZml4ZXMsIGFuZAo+ID4gPiA+IG5ldyBoZWxwZXJzIGJlaW5nIGlu
dHJvZHVjZWQuCj4gPiA+Cj4gPiA+IGRpbTogNDE1ZDJlOWUwNzU3ICgiUmV2ZXJ0ICJkcm0vZ2Vt
OiBSZW5hbWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKQo+ID4gPiB0byBkcm1fZ2VtX21hcF9v
ZmZzZXQoKSIiKTogbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4gPiBkaW06IGJlODU1Mzgy
YmFjYiAoIlJldmVydCAiZHJtL3BhbmZyb3N0OiBVc2UgZHJtX2dlbV9tYXBfb2Zmc2V0KCkiIik6
Cj4gPiA+IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gZGltOiBlNGVlZTkzZDI1Nzcg
KCJkcm0vdmdlbTogZHJvcCBEUk1fQVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiKToKPiA+ID4g
bWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4gPiBkaW06IDg4MjA5ZDJjNTAzNSAoImRybS9t
c206IGRyb3AgRFJNX0FVVEggdXNhZ2UgZnJvbSB0aGUgZHJpdmVyIik6Cj4gPiA+IG1hbmRhdG9y
eSByZXZpZXcgbWlzc2luZy4KPiA+ID4gZGltOiBjY2RhZTQyNTc1NjkgKCJkcm0vbm91dmVhdTog
cmVtb3ZlIG9wZW4tY29kZWQgZHJtX2ludmFsaWRfb3AoKSIpOgo+ID4gPiBtYW5kYXRvcnkgcmV2
aWV3IG1pc3NpbmcuCj4gPiA+Cj4gPiA+IFByZXR0eSBzdXJlIHJldmlldyBpbiBkcm0tbWlzYy1u
ZXh0IGlzIGEgcnVsZS4gSSBkb24ndCBldmVuIHNlZSBhY2tzCj4gPiA+IG9uIG1vc3Qgb2YgdGhl
c2UuCj4gPgo+ID4gVWdoLCBzb3JyeSBmb3IgdGhhdC4gSSBndWVzcyBJJ20gc3RpbGwgcHJldHR5
IG5ldyB0byB0aGUKPiA+IG1haW50YWluZXItc2lkZSBvZiBkaW0sIHdoaWNoIGNvbW1hbmRzIGRp
ZCB5b3UgdXNlIHRvIGNoZWNrIHRoYXQ/Cj4KPiBkaW0gYXBwbHktcHVsbCBkb2VzIHRoaXMuIElm
IGFsbCBjb21taXR0ZXJzIHVzZSB0aGUgdG9vbGluZyBhcyB0aGV5IHNob3VsZAo+IHRoZXkgc2hv
dWxkbid0IGJlIGFibGUgdG8gcHVzaCBwYXRjaGVzIHdoaWNoIHZpb2xhdGUgYW55dGhpbmcgaGVy
ZSwgdGhhdCdzCj4gd2h5IGRpbSByZXF1ZXN0LXB1bGwgZG9lc24ndCByZWplY3QuCgpZZWFoLCBz
dXJlLCBJIG1lYW50IHRvIGFzayBpZiB0aGVyZSB3YXMgYW55d2F5IHRvIGNoZWNrIHRoaXMgYmVm
b3JlCnNlbmRpbmcgdGhlIFBSIG9uIG91ciBlbmQuCgo+IFdlJ3JlIG5vdyB3b3JraW5nIG9uIHBh
dHFjaGVzIHRvIG1ha2Ugc3VyZSB5b3UgcmVhbGx5IGhhdmUgdG8gdXNlCj4gZGltIGZvciBtYW5h
Z2luZyBkcm0tbWlzYyBhbmQgYXBwbHlpbmcgcGF0Y2hlcy4KCkdyZWF0LCB0aGFua3MKCk1heGlt
ZQoKLS0KTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
