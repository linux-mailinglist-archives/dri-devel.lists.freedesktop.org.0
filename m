Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFF83619
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 18:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CF06E425;
	Tue,  6 Aug 2019 16:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70276E3D8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 16:01:51 +0000 (UTC)
X-Originating-IP: 88.168.111.231
Received: from localhost (lpr83-1-88-168-111-231.fbx.proxad.net
 [88.168.111.231]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B76FAC0009;
 Tue,  6 Aug 2019 16:01:47 +0000 (UTC)
Date: Tue, 6 Aug 2019 18:01:46 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PULL] drm-misc-next
Message-ID: <20190806160146.sj7l5wrrjtt5nhbz@flea>
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
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

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTA6MzM6NTNBTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gT24gU2F0LCAzIEF1ZyAyMDE5IGF0IDIwOjQ3LCBNYXhpbWUgUmlwYXJkIDxtYXhpbWUu
cmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBEYW5pZWwsIERhdmUsCj4gPgo+
ID4gSGVyZSBpcyB0aGUgZmlyc3QgKGFuZCBwcmV0dHkgbGF0ZSkgZHJtLW1pc2MtbmV4dCBQUi4K
PiA+Cj4gPiBJdCdzIHByZXR0eSBiaWcgZHVlIHRvIHRoZSBsYXRlbmVzcywgYnV0IHRoZXJlJ3Mg
bm90aGluZyByZWFsbHkgbWFqb3IKPiA+IHNob3dpbmcgdXAuIEl0J3MgcHJldHR5IG11Y2ggdGhl
IHVzdWFsIGJ1bmNoIG9mIHJld29ya3MsIGZpeGVzLCBhbmQKPiA+IG5ldyBoZWxwZXJzIGJlaW5n
IGludHJvZHVjZWQuCj4KPiBkaW06IDQxNWQyZTllMDc1NyAoIlJldmVydCAiZHJtL2dlbTogUmVu
YW1lIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkKPiB0byBkcm1fZ2VtX21hcF9vZmZzZXQoKSIi
KTogbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+IGRpbTogYmU4NTUzODJiYWNiICgiUmV2ZXJ0
ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQoKSIiKToKPiBtYW5kYXRvcnkg
cmV2aWV3IG1pc3NpbmcuCj4gZGltOiBlNGVlZTkzZDI1NzcgKCJkcm0vdmdlbTogZHJvcCBEUk1f
QVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiKToKPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3Npbmcu
Cj4gZGltOiA4ODIwOWQyYzUwMzUgKCJkcm0vbXNtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20g
dGhlIGRyaXZlciIpOgo+IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiBkaW06IGNjZGFlNDI1
NzU2OSAoImRybS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1jb2RlZCBkcm1faW52YWxpZF9vcCgpIik6
Cj4gbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+Cj4gUHJldHR5IHN1cmUgcmV2aWV3IGluIGRy
bS1taXNjLW5leHQgaXMgYSBydWxlLiBJIGRvbid0IGV2ZW4gc2VlIGFja3MKPiBvbiBtb3N0IG9m
IHRoZXNlLgoKVWdoLCBzb3JyeSBmb3IgdGhhdC4gSSBndWVzcyBJJ20gc3RpbGwgcHJldHR5IG5l
dyB0byB0aGUKbWFpbnRhaW5lci1zaWRlIG9mIGRpbSwgd2hpY2ggY29tbWFuZHMgZGlkIHlvdSB1
c2UgdG8gY2hlY2sgdGhhdD8KClRoYW5rcyEKTWF4aW1lCgotLQpNYXhpbWUgUmlwYXJkLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
