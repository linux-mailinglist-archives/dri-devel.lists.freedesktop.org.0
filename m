Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F87D8159
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 22:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD226E892;
	Tue, 15 Oct 2019 20:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951A66E892
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 20:55:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 13:55:12 -0700
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="185937394"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2019 13:55:12 -0700
Date: Tue, 15 Oct 2019 13:55:41 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [RFC] new uapi policy for drm
Message-ID: <20191015205541.GA24079@intel.com>
References: <CAPM=9txm6udXT9KtW=ROVMf2xRjd4sbPN9OPEQ--taP2vi-mmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9txm6udXT9KtW=ROVMf2xRjd4sbPN9OPEQ--taP2vi-mmQ@mail.gmail.com>
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDQ6MTY6MDBBTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gSSd2ZSBraWNrZWQgdGhpcyBhcm91bmQgaW4gbXkgaGVhZCBvdmVyIHRoZSBwYXN0IGZl
dyB3ZWVrcyBidXQgd2FudGVkCj4gdG8gZ2V0IHNvbWUgZmVlZGJhY2sgb24gd2hldGhlciBpdCdz
IGEgZ29vZCBpZGVhIG9yIHdoYXQgaW1wYWN0IGl0Cj4gbWlnaHQgaGF2ZSB0aGF0IEkgaGF2ZW4n
dCBjb25zaWRlcmVkLgo+IAo+IFdlIGFyZSBnZXR0aW5nIHJlcXVlc3RzIHZpYSBib3RoIGFtZGdw
dS9hbWRrZmQgYW5kIGk5MTUgZm9yIG5ldyB1c2VyCj4gQVBJcyBmb3IgdXNlcnNwYWNlIGRyaXZl
cnMgdGhhdCB0aHJvdyBjb2RlIG92ZXIgdGhlIHdhbGwgaW5zdGVhZCBvZgo+IGJlaW5nIG9wZW4g
c291cmNlIGRldmVsb3BlZCBwcm9qZWN0cywgYnV0IHdlIGFyZSBhbHNvIHNlZWluZyBpdCBmb3IK
PiBhbmRyb2lkIGRyaXZlcnMgYW5kIGttcyBwcm9wZXJ0aWVzLCBhbmQgd2UgaGFkIHRoYXQgaTkx
NSBjcmFwcHkgY3J0Ywo+IGJhY2tncm91bmQgdGhpbmcgdGhhdCB3YXMgZm9yIENocm9tZSBidXQg
Q2hyb21lIGRpZG4ndCB3YW50IGl0Lgo+IAo+IE5vdyB0aGlzIHByZXNlbnRzIGEgY291cGxlIG9m
IGlzc3VlczoKPiAKPiBhKSB0aGVzZSBwcm9qZWN0cyBkb24ndCBzZWVtIHRvIHRoYXQgZ29vZCBh
dCBmb2xsb3dpbmcgb3VyIGRldmVsb3BtZW50Cj4gZ3VpZGVsaW5lcywgYXZvaWQgZGV2ZWxvcGlu
ZyB1c2Vyc3BhY2UgZmVhdHVyZXMgaW4gcGFyYWxsZWwgaW4gdGhlCj4gb3BlbiBhbmQgaGF2aW5n
IGdvb2QgZGV2ZWxvcG1lbnQgaW1wbGVtZW50YXRpb25zIGJlZm9yZSBzdWJtaXR0aW5nCj4gdXBz
dHJlYW0uCj4gCj4gYikgdGhlc2UgcHJvamVjdHMgZG9uJ3QgaGF2ZSBleHBlcmllbmNlZCB1c2Vy
c3BhY2UgZGV2ZWxvcGVycwo+IHJldmlld2luZyB0aGVpciBrZXJuZWwgdWFwaXMuIE9uZSBiaWcg
YWR2YW50YWdlIG9mIGFkZGluZyB1YXBpcyB3aXRoCj4gbWVzYSBkZXZlbG9wZXJzIGlzIHRoZXkg
aGF2ZSBhIGxvdCBvZiBleHBlcmllbmNlIGluIHRoZSBhcmVhIGFzIHdlbGwuCj4gCj4gSXQncyBs
ZWFkaW5nIG1lIHRvIHRoaW5rIEkgd2FudCB0byBqdXN0IHN0b3AgYWxsIHVhcGkgc3VibWlzc2lv
bnMgdmlhCj4gZHJpdmVyIHRyZWVzLCBhbmQgaW5zdGVhZCBtYW5kYXRlIHRoYXQgYWxsIGRyaXZl
ciB1YXBpIGNoYW5nZXMgYXJlCj4gc2VudCBpbiBzZXBhcmF0ZSBnaXQgcHVsbCByZXF1ZXN0cyB0
byBkcmktZGV2ZWwsIEknZCB0cnkgKHdpdGggc29tZQo+IGhlbHApIHRvIGNhdGNoIGFsbCB1YXBp
IG1vZGlmaWNhdGlvbnMgaW4gbm9ybWFsIHRyZWVzLCBhbmQgcmVmdXNlCj4gcHVsbHMgdGhhdCBt
b2RpZmllZCB1YXBpLgoKSSB0cnVseSBzZWUgeW91ciByZWFzcyBhbmQgYSBzZXBhcmF0ZWQgcHVs
bCByZXF1ZXN0IHdvdWxkIGV2ZW4KZ2l2ZSBtb3JlIHZpc2liaWxpdHkgdG8gdGhlIFVBUEkgY2hh
bmdlcyBmb3IgZXZlcnlvbmUuIE15IG9ubHkgY29uY2Vybgp3b3VsZCBiZSB0aGUgZmxvdyBvZiBt
ZXJnaW5nIHRoaXMgb24gZGlmZmVyZW50IHJlcG9zaXRvcmllcywgZXRjLi4uCgpTbyBJJ2QgcHJl
ZmVyIGlmIHdlIGNvdWxkIGtlZXAgb24gdGhlIHNpbXBsZXN0IHNpZGUuCgo+IAo+IEF0IGxlYXN0
IEknbSBjb25zaWRlcmVkIHdyaXRpbmcgdGhlIHNjcmlwdCBhbmQgcmVmdXNpbmcgYW5kIHB1bGxz
IHRoYXQKPiBoYXZlIGEgdWFwaSBjaGFuZ2UgdGhhdCBkb2Vzbid0IGNvbnRhaW4gYSBsaW5rIHRv
IHRoZSB1c2Vyc3BhY2UKPiBjaGFuZ2VzIHJlcXVpcmVkIGZvciBpdCBpbiBhIHB1YmxpYyBkZXZl
bG9wZWQgcmVwby4KClRoaXMgaXMgYSBncmVhdCBpZGVhLgoKUHJvYmFibHkgYmV0dGVyIGlmIHdl
IGNvdWxkIGVuZm9yY2UgdGhhdCBvbiAiZGltIiBzbyB3ZSBjb3VsZG4ndCBldmVuCm1lcmdlIGEg
dWFwaSB3aXRob3V0IGEgbGluay4KCldvdWxkIHlvdSBjb25zaWRlciBhIGRpZmZlcmVudCB0YWcg
Zm9yIHRoYXQ6CgpVQVBJOiBodHRwczovL2dpdGxhYi4uLi9jb2RlLmMKCiJSZWZlcmVuY2U6IiBz
aG91bGQgYmUgZW5vdWdoLCBidXQgdGhhdCBjb3VsZCB2ZXJ5IGVhc2lseSBieXBhc3MgYW55IHNj
cmlwdAphbmQgYSBuZXcgdGFnIHdvdWxkIG1ha2UgdGhlIGNoYW5nZXMgZXZlbiBtb3JlIHZpc2li
bGUgaW4gYSB3YXkgdGhhdAp0aGUgc2VwYXJhdGUgcHVsbCByZXF1ZXN0IHdvdWxkbid0IGJlIG5l
ZWRlZC4KCj4gCj4gVGhvdWdodHM/Cj4gCj4gRGF2ZS4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
