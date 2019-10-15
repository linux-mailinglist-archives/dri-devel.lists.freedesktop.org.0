Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184DD8316
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 23:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388276E899;
	Tue, 15 Oct 2019 21:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62D6E899
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 21:58:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 14:58:10 -0700
X-IronPort-AV: E=Sophos;i="5.67,301,1566889200"; d="scan'208";a="189489281"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 14:58:10 -0700
Date: Tue, 15 Oct 2019 14:58:39 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC] new uapi policy for drm
Message-ID: <20191015215839.GB24079@intel.com>
References: <CAPM=9txm6udXT9KtW=ROVMf2xRjd4sbPN9OPEQ--taP2vi-mmQ@mail.gmail.com>
 <20191015205541.GA24079@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015205541.GA24079@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDE6NTU6NDFQTSAtMDcwMCwgUm9kcmlnbyBWaXZpIHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDA0OjE2OjAwQU0gKzEwMDAsIERhdmUgQWly
bGllIHdyb3RlOgo+ID4gSSd2ZSBraWNrZWQgdGhpcyBhcm91bmQgaW4gbXkgaGVhZCBvdmVyIHRo
ZSBwYXN0IGZldyB3ZWVrcyBidXQgd2FudGVkCj4gPiB0byBnZXQgc29tZSBmZWVkYmFjayBvbiB3
aGV0aGVyIGl0J3MgYSBnb29kIGlkZWEgb3Igd2hhdCBpbXBhY3QgaXQKPiA+IG1pZ2h0IGhhdmUg
dGhhdCBJIGhhdmVuJ3QgY29uc2lkZXJlZC4KPiA+IAo+ID4gV2UgYXJlIGdldHRpbmcgcmVxdWVz
dHMgdmlhIGJvdGggYW1kZ3B1L2FtZGtmZCBhbmQgaTkxNSBmb3IgbmV3IHVzZXIKPiA+IEFQSXMg
Zm9yIHVzZXJzcGFjZSBkcml2ZXJzIHRoYXQgdGhyb3cgY29kZSBvdmVyIHRoZSB3YWxsIGluc3Rl
YWQgb2YKPiA+IGJlaW5nIG9wZW4gc291cmNlIGRldmVsb3BlZCBwcm9qZWN0cywgYnV0IHdlIGFy
ZSBhbHNvIHNlZWluZyBpdCBmb3IKPiA+IGFuZHJvaWQgZHJpdmVycyBhbmQga21zIHByb3BlcnRp
ZXMsIGFuZCB3ZSBoYWQgdGhhdCBpOTE1IGNyYXBweSBjcnRjCj4gPiBiYWNrZ3JvdW5kIHRoaW5n
IHRoYXQgd2FzIGZvciBDaHJvbWUgYnV0IENocm9tZSBkaWRuJ3Qgd2FudCBpdC4KPiA+IAo+ID4g
Tm93IHRoaXMgcHJlc2VudHMgYSBjb3VwbGUgb2YgaXNzdWVzOgo+ID4gCj4gPiBhKSB0aGVzZSBw
cm9qZWN0cyBkb24ndCBzZWVtIHRvIHRoYXQgZ29vZCBhdCBmb2xsb3dpbmcgb3VyIGRldmVsb3Bt
ZW50Cj4gPiBndWlkZWxpbmVzLCBhdm9pZCBkZXZlbG9waW5nIHVzZXJzcGFjZSBmZWF0dXJlcyBp
biBwYXJhbGxlbCBpbiB0aGUKPiA+IG9wZW4gYW5kIGhhdmluZyBnb29kIGRldmVsb3BtZW50IGlt
cGxlbWVudGF0aW9ucyBiZWZvcmUgc3VibWl0dGluZwo+ID4gdXBzdHJlYW0uCj4gPiAKPiA+IGIp
IHRoZXNlIHByb2plY3RzIGRvbid0IGhhdmUgZXhwZXJpZW5jZWQgdXNlcnNwYWNlIGRldmVsb3Bl
cnMKPiA+IHJldmlld2luZyB0aGVpciBrZXJuZWwgdWFwaXMuIE9uZSBiaWcgYWR2YW50YWdlIG9m
IGFkZGluZyB1YXBpcyB3aXRoCj4gPiBtZXNhIGRldmVsb3BlcnMgaXMgdGhleSBoYXZlIGEgbG90
IG9mIGV4cGVyaWVuY2UgaW4gdGhlIGFyZWEgYXMgd2VsbC4KPiA+IAo+ID4gSXQncyBsZWFkaW5n
IG1lIHRvIHRoaW5rIEkgd2FudCB0byBqdXN0IHN0b3AgYWxsIHVhcGkgc3VibWlzc2lvbnMgdmlh
Cj4gPiBkcml2ZXIgdHJlZXMsIGFuZCBpbnN0ZWFkIG1hbmRhdGUgdGhhdCBhbGwgZHJpdmVyIHVh
cGkgY2hhbmdlcyBhcmUKPiA+IHNlbnQgaW4gc2VwYXJhdGUgZ2l0IHB1bGwgcmVxdWVzdHMgdG8g
ZHJpLWRldmVsLCBJJ2QgdHJ5ICh3aXRoIHNvbWUKPiA+IGhlbHApIHRvIGNhdGNoIGFsbCB1YXBp
IG1vZGlmaWNhdGlvbnMgaW4gbm9ybWFsIHRyZWVzLCBhbmQgcmVmdXNlCj4gPiBwdWxscyB0aGF0
IG1vZGlmaWVkIHVhcGkuCj4gCj4gSSB0cnVseSBzZWUgeW91ciByZWFzcwoKSSB0cnVseSBzZWUg
eW91ciByZWFzb25zLi4uLgoKKGFuZCBJIGNhbid0IGV2ZW4gYmxhbWUgYW4gYXV0by1jb3JyZWN0
b3IuLi4gc29ycnkpCgo+IGFuZCBhIHNlcGFyYXRlZCBwdWxsIHJlcXVlc3Qgd291bGQgZXZlbgo+
IGdpdmUgbW9yZSB2aXNpYmlsaXR5IHRvIHRoZSBVQVBJIGNoYW5nZXMgZm9yIGV2ZXJ5b25lLiBN
eSBvbmx5IGNvbmNlcm4KPiB3b3VsZCBiZSB0aGUgZmxvdyBvZiBtZXJnaW5nIHRoaXMgb24gZGlm
ZmVyZW50IHJlcG9zaXRvcmllcywgZXRjLi4uCj4gCj4gU28gSSdkIHByZWZlciBpZiB3ZSBjb3Vs
ZCBrZWVwIG9uIHRoZSBzaW1wbGVzdCBzaWRlLgo+IAo+ID4gCj4gPiBBdCBsZWFzdCBJJ20gY29u
c2lkZXJlZCB3cml0aW5nIHRoZSBzY3JpcHQgYW5kIHJlZnVzaW5nIGFuZCBwdWxscyB0aGF0Cj4g
PiBoYXZlIGEgdWFwaSBjaGFuZ2UgdGhhdCBkb2Vzbid0IGNvbnRhaW4gYSBsaW5rIHRvIHRoZSB1
c2Vyc3BhY2UKPiA+IGNoYW5nZXMgcmVxdWlyZWQgZm9yIGl0IGluIGEgcHVibGljIGRldmVsb3Bl
ZCByZXBvLgo+IAo+IFRoaXMgaXMgYSBncmVhdCBpZGVhLgo+IAo+IFByb2JhYmx5IGJldHRlciBp
ZiB3ZSBjb3VsZCBlbmZvcmNlIHRoYXQgb24gImRpbSIgc28gd2UgY291bGRuJ3QgZXZlbgo+IG1l
cmdlIGEgdWFwaSB3aXRob3V0IGEgbGluay4KPiAKPiBXb3VsZCB5b3UgY29uc2lkZXIgYSBkaWZm
ZXJlbnQgdGFnIGZvciB0aGF0Ogo+IAo+IFVBUEk6IGh0dHBzOi8vZ2l0bGFiLi4uL2NvZGUuYwo+
IAo+ICJSZWZlcmVuY2U6IiBzaG91bGQgYmUgZW5vdWdoLCBidXQgdGhhdCBjb3VsZCB2ZXJ5IGVh
c2lseSBieXBhc3MgYW55IHNjcmlwdAo+IGFuZCBhIG5ldyB0YWcgd291bGQgbWFrZSB0aGUgY2hh
bmdlcyBldmVuIG1vcmUgdmlzaWJsZSBpbiBhIHdheSB0aGF0Cj4gdGhlIHNlcGFyYXRlIHB1bGwg
cmVxdWVzdCB3b3VsZG4ndCBiZSBuZWVkZWQuCj4gCj4gPiAKPiA+IFRob3VnaHRzPwo+ID4gCj4g
PiBEYXZlLgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
