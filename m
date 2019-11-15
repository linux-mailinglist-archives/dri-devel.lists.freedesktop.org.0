Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B92BFDC70
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 12:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4913D6E4A7;
	Fri, 15 Nov 2019 11:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E186E4A7;
 Fri, 15 Nov 2019 11:42:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 03:42:42 -0800
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="199176515"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 03:42:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Bloomfield\,
 Jon" <jon.bloomfield@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: drm-next + i915 CVE yolo merge
In-Reply-To: <157381647503.4920.10629360010401025572@jlahtine-desk.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9txqtne1+ycij3YYmxWA1jAOB=VoWCZbjnLb71hwxB7_Cw@mail.gmail.com>
 <157381647503.4920.10629360010401025572@jlahtine-desk.ger.corp.intel.com>
Date: Fri, 15 Nov 2019 13:42:35 +0200
Message-ID: <875zjl1i38.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNSBOb3YgMjAxOSwgSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPiBRdW90aW5nIERhdmUgQWlybGllICgyMDE5LTExLTE0IDAz
OjMzOjI0KQo+PiBUaGUgbGFuZGluZyBvZiB0aGUgaTkxNSBDVkUgZml4ZXMgaW50byBMaW51cyB0
cmVlIGhhcyBjcmVhdGVkIGEgYml0IG9mCj4+IGEgbWVzcyBpbiBsaW51eC1uZXh0IGFuZCBkb3du
c3RyZWFtIGluIGRybS1uZXh0IHRyZWVzLgo+PiAKPj4gSSB0YWxrZWQgdG8gRGFuaWVsIGFuZCBo
ZSBoYWQgdGFsa2VkIHRvIEpvb25hcyBhIGJpdCwgYW5kIEkgZGVjaWRlZCB0bwo+PiBnbyB3aXRo
IHdoYXQgRGFuaWVsIGRlc2NyaWJlcyBhcyB0aGUgWU9MTyBtZXJnZSwgd2hlcmUgSSBqdXN0IHNv
bHZlIGl0Cj4+IGFuZCBwcmF5LCBhbmQgZXZlcnlvbmUgZWxzZSB2ZXJpZmllcy9maXhlcyBpdC4K
Pj4gCj4+IEluIG15IGZhdm91ciBJJ3ZlIGJlZW4gcmVhZGluZyB0aGVzZSBwYXRjaGVzIGZvciBh
IGNvdXBsZSBvZiBtb250aHMKPj4gbm93IGFuZCBhcHBsaWVkIHRoZW0gdG8gYSBsb3Qgb2YgcGxh
Y2VzLCBzbyBJJ20gcXVpdGUgZmFtaWxpYXIgd2l0aAo+PiB3aGF0IHRoZXkgYXJlIGRvaW5nLgo+
PiAKPj4gVGhlIHdvcnN0IGN1bHByaXQgd2FzIHRoZSBSQzYgY3R4IGNvcnJ1cHRpb24gZml4IHNp
bmNlIHRoZSB3aG9sZSBvZgo+PiByYzYgZ290IHJlZmFjdG9yZWQgaW4gbmV4dC4gSG93ZXZlciBJ
IGFsc28gaGFkIGFjY2VzcyB0byBhIHZlcnNpb24gb2YKPj4gdGhpcyBwYXRjaCBKb24gd3JvdGUg
b24gZHJtLXRpcCBhIGNvdXBsZSBvZiB3ZWVrcyBhZ28uCj4KPiBXZSd2ZSBub3cgdGVzdGVkIGRy
bS1uZXh0IGFuZCBmb3VuZCBpdCB3b3JraW5nIGZpbmUuIEFzIGEgbmV4dCBzdGVwIEphbmkKPiB3
aWxsIGJlIGJhY2ttZXJnZSB0byBkcm0taW50ZWwtbmV4dC1xdWV1ZWQuCgpEb25lIGFuZCBwdXNo
ZWQgb3V0LgoKVGhhbmtzLApKYW5pLgoKCj4KPiBSZWdhcmRzLCBKb29uYXMKPgo+PiBJIHRvb2sg
dGhhdCBwYXRjaCwgYXBwbGllZCBpdCBhbmQgZml4ZWQgaXQgdXAgb24gdG9wIG9mIGRybS1uZXh0
LiBUaGVuCj4+IEkgYmFja21lcmdlZCB0aGUgY29tbWl0IHRoYXQgYWxzbyB3ZW50IGludG8gTGlu
dXMnIHRyZWUuIFRoZW4gSQo+PiByZW1vdmVkIGFueSBldmlkZW5jZSBvZiB0aGUgUkM2IHBhdGNo
IGZyb20gTGludXMnIHRyZWUgYW5kIGxlZnQgdGhlCj4+IG5ld2VyIHZlcnNpb24gcGllY2VzIGlu
IHBsYWNlLiBUaGUgb3RoZXIgc3R1ZmYgbW9zdGx5IG1lcmdlZCBmaW5lIGFuZAo+PiB0aGUgcmVz
dWx0cyBsb29rZWQgZmluZSwgYnV0IEknZCBkZWZpbml0ZWx5IHRoaW5rIGV2ZXJ5b25lIGF0IElu
dGVsCj4+IHNob3VsZCBiZSBzdGFyaW5nIGF0IGl0LCBhbmQgbXkgZGlucSB0aXAgcmVzb2x1dGlv
bnMgQVNBUCBhbmQKPj4gaG9wZWZ1bGx5IGl0IGdvZXMgaW50byBDSSBhbmQgY29tZXMgb3V0IHNt
ZWxsaW5nIG9mIHNvbWV0aGluZyBnb29kLgo+PiAKPj4gTGV0IG1lIGtub3cgaWYgaXQncyBhbGwg
aG9ycmlibGUgYXNhcCwKPj4gVGhhbmtzLAo+PiBEYXZlLgoKLS0gCkphbmkgTmlrdWxhLCBJbnRl
bCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
