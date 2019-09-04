Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7CA7DF6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E128997C;
	Wed,  4 Sep 2019 08:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D131F8997C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:35:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 01:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="194654077"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.113])
 by orsmga002.jf.intel.com with ESMTP; 04 Sep 2019 01:35:32 -0700
Date: Wed, 4 Sep 2019 16:35:58 +0800
From: Feng Tang <feng.tang@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [LKP] [drm/mgag200] 90f479ae51: vm-scalability.median -18.8%
 regression
Message-ID: <20190904083558.GD5541@shbuild999.sh.intel.com>
References: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
 <20190824051605.GA63850@shbuild999.sh.intel.com>
 <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
 <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
 <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
 <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
 <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
 <20190904062716.GC5541@shbuild999.sh.intel.com>
 <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
 <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rong Chen <rong.a.chen@intel.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKP <lkp@01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMTA6MTE6MTFBTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIFNlcCA0LCAyMDE5IGF0IDg6NTMgQU0gVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4KPiA+IEhpCj4gPgo+
ID4gQW0gMDQuMDkuMTkgdW0gMDg6Mjcgc2NocmllYiBGZW5nIFRhbmc6Cj4gPiA+PiBUaGFuayB5
b3UgZm9yIHRlc3RpbmcuIEJ1dCBkb24ndCBnZXQgdG9vIGV4Y2l0ZWQsIGJlY2F1c2UgdGhlIHBh
dGNoCj4gPiA+PiBzaW11bGF0ZXMgYSBidWcgdGhhdCB3YXMgcHJlc2VudCBpbiB0aGUgb3JpZ2lu
YWwgbWdhZzIwMCBjb2RlLiBBCj4gPiA+PiBzaWduaWZpY2FudCBudW1iZXIgb2YgZnJhbWVzIGFy
ZSBzaW1wbHkgc2tpcHBlZC4gVGhhdCBpcyBhcHBhcmVudGx5IHRoZQo+ID4gPj4gcmVhc29uIHdo
eSBpdCdzIGZhc3Rlci4KPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgaW5mbywg
c28gdGhlIG9yaWdpbmFsIGNvZGUgc2tpcHMgdGltZS1jb25zdW1pbmcKPiA+ID4gd29yayBpbnNp
ZGUgYXRvbWljIGNvbnRleHQgb24gcHVycG9zZS4gSXMgdGhlcmUgYW55IHNwYWNlIHRvIG9wdG1p
c2UgaXQ/Cj4gPiA+IElmIDIgc2NoZWR1bGVkIHVwZGF0ZSB3b3JrZXIgYXJlIGhhbmRsZWQgYXQg
YWxtb3N0IHNhbWUgdGltZSwgY2FuIG9uZSBiZQo+ID4gPiBza2lwcGVkPwo+ID4KPiA+IFRvIG15
IGtub3dsZWRnZSwgdGhlcmUncyBvbmx5IG9uZSBpbnN0YW5jZSBvZiB0aGUgd29ya2VyLiBSZS1z
Y2hlZHVsaW5nCj4gPiB0aGUgd29ya2VyIGJlZm9yZSBhIHByZXZpb3VzIGluc3RhbmNlIHN0YXJ0
ZWQsIHdpbGwgbm90IGNyZWF0ZSBhIHNlY29uZAo+ID4gaW5zdGFuY2UuIFRoZSB3b3JrZXIncyBp
bnN0YW5jZSB3aWxsIGNvbXBsZXRlIGFsbCBwZW5kaW5nIHVwZGF0ZXMuIFNvIGluCj4gPiBzb21l
IHdheSwgc2tpcHBpbmcgd29ya2VycyBhbHJlYWR5IGhhcHBlbnMuCj4gCj4gU28gSSB0aGluayB0
aGF0IHRoZSBtb3N0IG9mdGVuIGZiY29uIHVwZGF0ZSBmcm9tIGF0b21pYyBjb250ZXh0IGlzIHRo
ZQo+IGJsaW5raW5nIGN1cnNvci4gSWYgeW91IGRpc2FibGUgdGhhdCBvbmUgeW91IHNob3VsZCBi
ZSBiYWNrIHRvIHRoZSBvbGQKPiBwZXJmb3JtYW5jZSBsZXZlbCBJIHRoaW5rLCBzaW5jZSBqdXN0
IHdyaXRpbmcgdG8gZG1lc2cgaXMgZnJvbSBwcm9jZXNzCj4gY29udGV4dCwgc28gc2hvdWxkbid0
IGNoYW5nZS4KCkhtbSwgdGhlbiBmb3IgdGhlIG9sZCBkcml2ZXIsIGl0IHNob3VsZCBhbHNvIGRv
IHRoZSBtb3N0IHVwZGF0ZSBpbgpub24tYXRvbWljIGNvbnRleHQ/IAoKT25lIG90aGVyIHRoaW5n
IGlzLCBJIHByb2ZpbGVkIHRoYXQgdXBkYXRpbmcgYSAzTUIgc2hhZG93IGJ1ZmZlciBuZWVkcwoy
MCBtcywgd2hpY2ggdHJhbnNmZXIgdG8gMTUwIE1CL3MgYmFuZHdpZHRoLiBDb3VsZCBpdCBiZSBy
ZWxhdGVkIHdpdGgKdGhlIGNhY2hlIHNldHRpbmcgb2YgRFJNIHNoYWRvdyBidWZmZXI/IHNheSB0
aGUgb3JnaW5hbCBjb2RlIHVzZSBhCmNhY2hhYmxlIGJ1ZmZlcj8KCgo+IAo+IGh0dHBzOi8vdW5p
eC5zdGFja2V4Y2hhbmdlLmNvbS9xdWVzdGlvbnMvMzc1OS9ob3ctdG8tc3RvcC1jdXJzb3ItZnJv
bS1ibGlua2luZwo+IAo+IEJ1bmNoIG9mIHRyaWNrcywgYnV0IHRiaCBJIGhhdmVuJ3QgdGVzdGVk
IHRoZW0uCgpUaG9tYXMgaGFzIHN1Z2dlc3RlZCB0byBkaXNhYmxlIGN1cnNvbiBieQoJZWNobyAw
ID4gL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZ3JhcGhpY3MvZmJjb24vY3Vyc29yX2JsaW5rCgpXZSB0
cmllZCB0aGF0IHdheSwgYW5kIG5vIGNoYW5nZSBmb3IgdGhlIHBlcmZvcm1hbmNlIGRhdGEuCgpU
aGFua3MsCkZlbmcKCj4gCj4gSW4gYW55IGNhc2UsIEkgc3RpbGwgc3Ryb25nbHkgYWR2aWNlIHlv
dSBkb24ndCBwcmludCBhbnl0aGluZyB0byBkbWVzZwo+IG9yIGZiY29uIHdoaWxlIGJlbmNobWFy
a2luZywgYmVjYXVzZSBkbWVzZy9wcmludGYgYXJlIGFueXRoaW5nIGJ1dAo+IGZhc3QsIGVzcGVj
aWFsbHkgaWYgYSBncHUgZHJpdmVyIGlzIGludm9sdmVkLiBUaGVyZSdzIHNvbWUgZWZmb3J0cyB0
bwo+IG1ha2UgdGhlIGRtZXNnL3ByaW50ayBzaWRlIGxlc3MgcGFpbmZ1bCAodW50YW5nbGluZyB0
aGUgY29uc29sZV9sb2NrCj4gZnJvbSBwcmludGspLCBidXQgZnVuZGFtZW50YWxseSBwcmludGlu
ZyB0byB0aGUgZ3B1IGZyb20gdGhlIGtlcm5lbAo+IHRocm91Z2ggZG1lc2cvZmJjb24gd29uJ3Qg
YmUgY2hlYXAuIEl0J3MganVzdCBub3Qgc29tZXRoaW5nIHdlCj4gb3B0aW1pemUgYmV5b25kICJt
YWtlIHN1cmUgaXQgd29ya3MgZm9yIGVtZXJnZW5jaWVzIi4KPiAtRGFuaWVsCj4gCj4gPgo+ID4g
QmVzdCByZWdhcmRzCj4gPiBUaG9tYXMKPiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gRmVu
Zwo+ID4gPgo+ID4gPj4KPiA+ID4+IEJlc3QgcmVnYXJkcwo+ID4gPj4gVGhvbWFzCj4gPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo+ID4gPgo+ID4KPiA+IC0tCj4gPiBUaG9tYXMgWmltbWVybWFubgo+ID4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcgo+ID4gU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyYXNzZSA1LCA5
MDQwOSBOdWVybmJlcmcsIEdlcm1hbnkKPiA+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkg
SGlnZ2lucywgU3JpIFJhc2lhaAo+ID4gSFJCIDIxMjg0IChBRyBOw7xybmJlcmcpCj4gPgo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cj4gCj4gCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
