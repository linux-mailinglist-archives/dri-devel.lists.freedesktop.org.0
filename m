Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12DC4841
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02A06E8E4;
	Wed,  2 Oct 2019 07:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D79A189DBD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:34:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70B7D1000;
 Tue,  1 Oct 2019 07:34:16 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF583F71A;
 Tue,  1 Oct 2019 07:34:15 -0700 (PDT)
Date: Tue, 1 Oct 2019 15:34:07 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: juno: add GPU subsystem
Message-ID: <20191001143350.GA404@bogus>
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
 <20191001085954.GA10443@bogus>
 <2a3b2fe1-b08a-bc21-6f3b-4a595b51463c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a3b2fe1-b08a-bc21-6f3b-4a595b51463c@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDE6NDU6MzBQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IE9uIDAxLzEwLzIwMTkgMDk6NTksIFN1ZGVlcCBIb2xsYSB3cm90ZToKPiA+IE9uIE1v
biwgU2VwIDMwLCAyMDE5IGF0IDEyOjQ2OjMzUE0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+
ID4gPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAxMDoyNSBBTSBSb2JpbiBNdXJwaHkgPHJvYmlu
Lm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBTaW5jZSB3ZSBub3cgaGF2
ZSBiaW5kaW5ncyBmb3IgTWFsaSBNaWRnYXJkIEdQVXMsIGxldCdzIHVzZSB0aGVtIHRvCj4gPiA+
ID4gZGVzY3JpYmUgSnVubydzIEdQVSBzdWJzeXN0ZW0sIGlmIG9ubHkgYmVjYXVzZSB3ZSBjYW4u
IEp1bm8gc3BvcnRzIGEKPiA+ID4gPiBNYWxpLVQ2MjQgaW50ZWdyYXRlZCBiZWhpbmQgYW4gTU1V
LTQwMCAoYXMgYSBnZXN0dXJlIHRvd2FyZHMKPiA+ID4gPiB2aXJ0dWFsaXNhdGlvbiksIGluIHRo
ZWlyIG93biBkZWRpY2F0ZWQgcG93ZXIgZG9tYWluIHdpdGggRFZGUwo+ID4gPiA+IGNvbnRyb2xs
ZWQgYnkgdGhlIFNDUC4KPiA+ID4gPiAKPiA+ID4gPiBDQzogTGl2aXUgRHVkYXUgPGxpdml1LmR1
ZGF1QGFybS5jb20+Cj4gPiA+ID4gQ0M6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5j
b20+Cj4gPiA+ID4gQ0M6IExvcmVuem8gUGllcmFsaXNpIDxsb3JlbnpvLnBpZXJhbGlzaUBhcm0u
Y29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFy
bS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1p
ZGdhcmQueWFtbCAgICAgICAgfCAgNSArKystCj4gPiA+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FybS9qdW5vLWJhc2UuZHRzaSAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrCj4gPiA+
ID4gICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
ID4gCj4gPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4g
Cj4gPiBJZiB5b3UgcGxhbiB0byB0YWtlIGl0IGFsb25nIHdpdGggZHJpdmVyIGNoYW5nZSwKPiA+
IAo+ID4gQWNrZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+Cj4gPiAK
PiA+IElmIG5vdCwgcGxlYXNlIGxldCB1cyBrbm93LiBJIGNhbiB0YWtlIGl0IGZvciB2NS41Cj4g
Cj4gVGhlIGRyaXZlciBjaGFuZ2UgaXMgZGViYXRhYmxlIGFuZCBub3Qgc3RyaWN0bHkgbmVjZXNz
YXJ5LCBzbyBpdCBwcm9iYWJseQo+IG1ha2VzIG1vcmUgc2Vuc2UgdG8gdGFrZSB0aGlzIG9uZSB0
aHJvdWdoIHRoZSBWRXhwcmVzcyB0cmVlIG9uIGl0cyBvd24uIEkKPiB3b3VsZG4ndCBzdWdnZXN0
IGZsaXBwaW5nIHRoZSBzdGF0dXMgdG8gImVuYWJsZWQiIGp1c3QgeWV0LCBidXQgaXQgc2VlbXMK
ClN1cmUsIG1ha2Ugc2Vuc2UuCgo+IHdvcnRoIHB1dHRpbmcgdGhlIGJhc2ljIGRlc2NyaXB0aW9u
IGluIHBsYWNlIGFzIGEganVtcGluZy1vZmYgcG9pbnQgZm9yCj4gZm9sa3MgdG8gaGFjayBvbiAo
ZS5nLiBpdCdzIGFub3RoZXIgJ2ludGVyZXN0aW5nJyBjYXNlIGZvciBkZXZmcmVxIE9QUAo+IHN0
dWZmKS4KCklJVUMsIHRoZSBkZXZmcmVxIHN1cHBvcnQgaW4gcGFuZnJvc3QgZHJpdmVyIHNob3Vs
ZCB3b3JrIGZpbmUgd2l0aCBTQ1BJCmFzIGl0IGhhcyBjbG9jayBwcm92aWRlciBmb3IgR1BVIERW
RlMuCgpXaXRoIFNDTUksIHdlIGRvbid0IHdhbnQgdG8gaG9vayB0byBjbG9jayBmcmFtZXdvcmss
IGJ1dCBJIGFtIHlldCB0byBjb21lCnVwIHdpdGggYSBzYW5lIGdlbmVyaWMgd2F5IHRvIGFkZCBT
Q01JIGRldmZyZXEgYW5kIGludGVncmF0ZSBpdCB3aXRoIHRoZQpwYW5mcm9zdCBkZXZmcmVxLgoK
LS0KUmVnYXJkcywKU3VkZWVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
