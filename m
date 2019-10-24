Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85796E3A12
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 19:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D41F6E5B6;
	Thu, 24 Oct 2019 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346A6E5B6;
 Thu, 24 Oct 2019 17:31:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 10:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; d="scan'208";a="282008162"
Received: from nesterov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.8.153])
 by orsmga001.jf.intel.com with ESMTP; 24 Oct 2019 10:30:52 -0700
Date: Thu, 24 Oct 2019 20:30:51 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH] Cleanup: replace prefered with preferred
Message-ID: <20191024173051.GB7948@linux.intel.com>
References: <20191022214208.211448-1-salyzyn@android.com>
 <20191023115637.GA23733@linux.intel.com>
 <fa12cb96-7a93-bf85-214d-a7bfaf8b8b0a@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa12cb96-7a93-bf85-214d-a7bfaf8b8b0a@android.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Alexander Aring <alex.aring@gmail.com>, linux-efi@vger.kernel.org,
 Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Feng Tang <feng.tang@intel.com>,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Jonathan Corbet <corbet@lwn.net>,
 Francesco Ruggeri <fruggeri@arista.com>,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, kernel-team@android.com,
 linux-media@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, hersen wu <hersenxs.wu@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Maxim Martynov <maxim@arista.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-bluetooth@vger.kernel.org,
 David Ahern <dsahern@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDg6NDA6NTlBTSAtMDcwMCwgTWFyayBTYWx5enluIHdy
b3RlOgo+IE9uIDEwLzIzLzE5IDQ6NTYgQU0sIEphcmtrbyBTYWtraW5lbiB3cm90ZToKPiA+IE9u
IFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDAyOjQxOjQ1UE0gLTA3MDAsIE1hcmsgU2FseXp5biB3cm90
ZToKPiA+ID4gUmVwbGFjZSBhbGwgb2NjdXJyZW5jZXMgb2YgcHJlZmVyZWQgd2l0aCBwcmVmZXJy
ZWQgdG8gbWFrZSBmdXR1cmUKPiA+ID4gY2hlY2twYXRjaC5wbCdzIGhhcHB5LiAgQSBmZXcgcGxh
Y2VzIHRoZSBpbmNvcnJlY3Qgc3BlbGxpbmcgaXMKPiA+ID4gbWF0Y2hlZCB3aXRoIHRoZSBjb3Jy
ZWN0IHNwZWxsaW5nIHRvIHByZXNlcnZlIGV4aXN0aW5nIHVzZXIgc3BhY2UgQVBJLgo+ID4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyayBTYWx5enluIDxzYWx5enluQGFuZHJvaWQuY29tPgo+
ID4gSSdkIGZpeCBzdWNoIHRoaW5ncyB3aGVuIHRoZSBjb2RlIGlzIG90aGVyd2lzZSBjaGFuZ2Ug
YW5kIHNjb3BlIHRoaXMKPiA+IHBhdGNoIG9ubHkgdG8gRG9jdW1lbnRhdGlvbi8uIFRoZXJlIGlz
IG5vIHByYWdtYXRpYyBiZW5lZml0IG9mIGRvaW5nCj4gPiB0aGlzIGZvciB0aGUgY29kZS4KPiA+
IAo+ID4gL0phcmtrbwo+IAo+IFRoZSBwcmFnbWF0aWMgYmVuZWZpdCBjb21lcyB3aXRoIHRoZSB1
c2Ugb2YgYW4gQUJJL0FQSSBjaGVja2VyICh3aGljaCBpcyBhCj4gJ2Rpc3RybycgdGhpbmcsIG5v
dCBhIHRvcCBvZiB0cmVlIGtlcm5lbCB0aGluZykgcHJvZHVjZXMgaXRzIG1hcCB3aGljaCBpcwo+
IHR5cGljYWxseSByZXF1aXJlZCB0byBiZSBjby1sb2NhdGVkIGluIHRoZSBzYW1lIHRyZWUgYXMg
dGhlIGtlcm5lbAo+IHJlcG9zaXRvcnkuIFF1aXRlIGEgZmV3IEFCSS9BUEkgdXBkYXRlIGNoZWNr
aW5zIHJlc3VsdCBpbiBhIGNoZWNrcGF0Y2gucGwKPiBjb21wbGFpbnQgYWJvdXQgdGhlIG1pc3Nw
ZWxsZWQgZWxlbWVudHMgYmVpbmcgKHJlLSlyZWNvcmRlZCBkdWUgdG8KPiBwcm94aW1pdHkuIFdl
IGhhdmUgYSBzZXBhcmF0ZSB0YXNrIHRvIGltcHJvdmUgaG93IGl0IGlzIHRyYWNrZWQgaW4gQW5k
cm9pZAo+IHRvIHJlZHVjZSBtaWxlcG9zdCBtYXJrZXIgY2hhbmdlcyB0aGF0IHJlc3VsdCBpbiBz
d2VlcGluZyBjaGFuZ2VzIHRvIHRoZQo+IGRhdGFiYXNlIHdoaWNoIHdvdWxkIHJlZHVjZSB0aGUg
b2NjdXJyZW5jZXMuCj4gCj4gSSB3aWxsIHNwbGl0IHRoaXMgYmV0d2VlbiBwdXJlIGFuZCBpbmVy
dCBkb2N1bWVudGF0aW9uL2NvbW1lbnRzIGZvciBub3csCj4gd2l0aCBhIGZvbGxvd3VwIGxhdGVy
IGZvciB0aGUgY29kZSBwb3J0aW9uIHdoaWNoIHVuZGVyc3RhbmRhYmx5IGlzIG1vcmUKPiBjb250
cm92ZXJzaWFsLgo+IAo+IENsZWFudXAgaXMgdGhlIGxlYXN0IGFwcHJlY2lhdGVkIHBhcnQgb2Yg
a2VybmVsIG1haW50ZW5hbmNlIDstfS4KPiAKPiBTaW5jZXJlbHkgLS0gTWFyayBTYWx5enluCgpJ
J20gYSBzdHJvbmcgYmVsaWV2ZXIgb2YgImV2b2x1dGlvbmFyeSIgYXBwcm9hY2guIFBhdGNoIHNl
dHMgZm9yIHRoZQptb3N0IHBhcnQgKGV2ZXJ5dGhpbmcgaW4gdGhlIGVuZCBoYXMgdG8gYmUgY29u
c2lkZXJlZCBjYXNlIGJ5IGNhc2UsIG5vdAphIHN0cmljdCBydWxlKSBzaG91bGQgaGF2ZSBzb21l
IGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnZvbHZlZC4KCldoYXQgSSBkbyByZXF1aXJlIGZvciB0aGUg
cGFydHMgdGhhdCBJIG1haW50YWluIGlzIHRoYXQgYW55IG5ldyBjaGFuZ2UKd2lsbCByZXN1bHQg
Y2xlYW5lciBjb2RlIGJhc2UgdGhhbiB0aGUgb25lIHRoYXQgZXhpc3RlZCBiZWZvcmUgdGhhdApj
aGFuZ2Ugd2FzIGFwcGxpZWQuIEFnYWluLCB0aGVyZSBhcmUgc29tZSBleGNlcHRpb25zIHRvIHRo
aXMgZS5nLgpjaXJjdWxhdGluZyBhIGZpcm13YXJlIGJ1ZyBidXQgdGhpcyBpcyBteSBkcml2aW5n
IGd1aWRlbGluZSBhcyBhCm1haW50YWluZXIuCgpEb2luZyBjbGVhbnVwcyBqdXN0IGZvciBjbGVh
bnVwcyBjYW4gc29tZXRpbWVzIGFkZCB1bm5lY2Vzc2FyeSBtZXJnZQpjb25mbGljdHMgd2hlbiBi
YWNrcG9ydGluZyBwYXRjaGVzIHRvIHN0YWJsZSBrZXJuZWxzLiBUaHVzLCBpZiB5b3UgYXJlCmRv
aW5nIGp1c3QgYSBjbGVhbnVwIHlvdSBzaG91bGQgaGF2ZSBleHRyZW1lbHkgZ29vZCByZWFzb25z
IHRvIGRvIHNvLgoKL0phcmtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
