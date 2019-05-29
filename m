Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A52DA3E
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FC06E038;
	Wed, 29 May 2019 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DA06E038
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:19:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 03:19:20 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 03:19:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+),
 providing EDID manually fails
In-Reply-To: <alpine.DEB.2.20.1905291127350.24401@whs-18.cs.helsinki.fi>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
 <878surn919.wl-ashutosh.dixit@intel.com> <87sgsz593p.fsf@intel.com>
 <alpine.DEB.2.20.1905291127350.24401@whs-18.cs.helsinki.fi>
Date: Wed, 29 May 2019 13:22:30 +0300
Message-ID: <878sup5zmh.fsf@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOSBNYXkgMjAxOSwgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AY3MuaGVs
c2lua2kuZmk+IHdyb3RlOgo+IE9uIFR1ZSwgMjggTWF5IDIwMTksIEphbmkgTmlrdWxhIHdyb3Rl
Ogo+Cj4+IE9uIE1vbiwgMjcgTWF5IDIwMTksIEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhp
dEBpbnRlbC5jb20+IHdyb3RlOgo+PiA+IE9uIFN1biwgMjYgTWF5IDIwMTkgMTI6NTA6NTEgLTA3
MDAsIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+PiA+Pgo+PiA+PiBIaSBhbGwsCj4+ID4+Cj4+ID4+
IEkndmUgYSB3b3Jrc3RhdGlvbiB3aGljaCBoYXMgaW50ZXJuYWwgVkdBIHRoYXQgaXMgZGV0ZWN0
ZWQgYXMgQVNUIDI0MDAgYW5kCj4+ID4+IHdpdGggaXQgRURJRCBoYXMgYmVlbiBhbHdheXMgcXVp
dGUgZmxha3kgKGV4Y2VwdCBmb3Igc29tZSB0aW1lIGl0IHdvcmtlZAo+PiA+PiB3aXRoIDQuMTQg
bG9uZyBlbm91Z2ggdGhhdCBJIHRob3VnaHQgdGhlIHByb2JsZW1zIHdvdWxkIGJlIHBhc3QgdW50
aWwgdGhlCj4+ID4+IHByb2JsZW1zIHJlYXBwZWFyZWQgYWxzbyB3aXRoIDQuMTQpLiBUaHVzLCBJ
J3ZlIHByb3ZpZGVkIG1hbnVhbGx5IHRoZSBFRElECj4+ID4+IHRoYXQgSSBleHRyYWN0ZWQgZnJv
bSB0aGUgbW9uaXRvciB1c2luZyBvdGhlciBjb21wdXRlciAodGhlIG1vbml0b3IgaXRzZWxmCj4+
ID4+IHdvcmtlZCBqdXN0IGZpbmUgb24gdGhlIGVhcmxpZXIgY29tcHV0ZXIgc28gaXQgaXMgbGlr
ZWx5IGZpbmUpLgo+PiA+Pgo+PiA+PiBJIHNldHVwIHRoZSBtYW51YWwgRURJRCB1c2luZyBkcm1f
a21zX2hlbHBlci5lZGlkX2Zpcm13YXJlLCBob3dldmVyLAo+PiA+PiBhZnRlciB1cGdyYWRpbmcg
dG8gNC4xOS40NSBpdCBzdG9wcGVkIHdvcmtpbmcgKG5vICJHb3QgZXh0ZXJuYWwgRURJRCBiYXNl
Cj4+ID4+IGJsb2NrIiBhcHBlYXJzIGluIGRtZXNnLCB0aGUgdGV4dCBtb2RlIGlzIGtlcHQgaW4g
dGhlIGxvd2VyIHJlcyBtb2RlLCBhbmQKPj4gPj4gWG9yZyBsb2dzIG5vIGxvbmdlciBkdW1wcyB0
aGUgRURJRCBpbmZvIGxpa2UgaXQgZGlkIHdpdGggNC4xNCkuIFNvIEkgZ3Vlc3MKPj4gPj4gdGhl
IEVESUQgSSBwcm92aWRlZCBtYW51YWxseSBvbiB0aGUgY29tbWFuZCBsaW5lIGlzIG5vdCBjb3Jy
ZWN0bHkgcHV0IGludG8KPj4gPj4gdXNlIHdpdGggNC4xOSsga2VybmVscy4KPj4gPj4KPj4gPj4g
VGhlIDQuMTkgZG1lc2cgaW5kaWNhdGVkIHRoYXQgZHJtX2ttc19oZWxwZXIuZWRpZF9maXJtd2Fy
ZSBpcyBkZXByZWNhdGVkCj4+ID4+IHNvIEkgYWxzbyB0ZXN0ZWQgd2l0aCBkcm0uZWRpZF9maXJt
d2FyZSBpdCBzdWdnZXN0ZWQgYXMgdGhlIHJlcGxhY2VtZW50Cj4+ID4+IGJ1dCB3aXRoIG5vIGx1
Y2sgKGJ1dCBJIGJlbGlldmUgYWxzbyB0aGUgZHJtX2ttc19oZWxwZXIgb25lIHNob3VsZCBoYXZl
Cj4+ID4+IHdvcmtlZCBhcyBpdCB3YXMgb25seSAiZGVwcmVjYXRlZCIpLgo+PiA+Pgo+PiA+PiBJ
IGFsc28gdHJpZWQgNS4xLjIgYnV0IGl0IGRpZCBub3Qgd29yayBhbnkgYmV0dGVyIChhbmQgd2l0
aCBpdCBhbHNvIHRyaWVkCj4+ID4+IHJlbW92aW5nIGFsbCB0aGUgbWFudWFsICouZWRpZF9maXJt
d2FyZSBmcm9tIHRoZSBjb21tYW5kIGxpbmUgc28gSSBzdGlsbAo+PiA+PiBuZWVkIHRvIHByb3Zp
ZGUgb25lIG1hbnVhbGx5IHRvIGhhdmUgaXQgcmVsaWFibGUgd29ya2luZyBpdCBzZWVtcykuCj4+
ID4KPj4gPiBJIGJlbGlldmUgdGhlcmUgaXMgYSBidWcgYWxyZWFkeSB0cmFja2luZyB0aGlzLCBo
ZXJlOgo+PiA+Cj4+ID4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTA3NTgzCj4+IAo+PiBJbHBvLCBkb2VzIHZpZGVvPVZHQS0xOmUgY29tbWFuZC1saW5lIG9w
dGlvbiB3b3JrIGFyb3VuZCB0aGUgcHJvYmxlbSBmb3IKPj4geW91Pwo+Cj4gWWVzIGl0IGRvZXM7
IHRvZ2V0aGVyIHdpdGggdGhlIG1vZGVsaW5lIHN0dWZmIGZvciBYb3JnIChhZnRlciByZWFkaW5n
IHRoZSAKPiByZWZlcmVuY2VkIGJ1ZyByZXBvcnQgSSByZWFsaXplZCBJIGNhbiBmaXggdGhlIFgg
c2lkZSB3aXRoIGl0KS4gU28gSSBub3cgCj4gaGF2ZSB0aGUgZGVzaXJlZCBtb2Rlcy9yZXNvbHV0
aW9ucyBpbiB1c2UuIFRoYW5rIHlvdSBhbGwhCgpHcmVhdCEgSXQgc2hvdWxkIGJlIGVub3VnaCB0
byBqdXN0IGhhdmUgdGhlIHJlcGxhY2VtZW50IGZpcm13YXJlIEVESUQKZm9yIHRoZSBtb2Rlcywg
YXMgbG9uZyBhcyB5b3UgaGF2ZSBhbiBFRElEIHRoYXQgcmVwcmVzZW50cyB0aGUKY2FwYWJpbGl0
aWVzIG9mIHRoZSBkaXNwbGF5LiBUaGUgbW9kZWxpbmVzIGZvciBYb3JnIHNob3VsZCBub3QgYmUK
bmVlZGVkLgoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
