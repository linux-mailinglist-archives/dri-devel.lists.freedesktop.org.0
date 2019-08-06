Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71BF837DF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 19:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DF76E4F4;
	Tue,  6 Aug 2019 17:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C89D6E4F4;
 Tue,  6 Aug 2019 17:28:37 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 10:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="349486267"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga005.jf.intel.com with ESMTP; 06 Aug 2019 10:28:34 -0700
Date: Tue, 6 Aug 2019 15:59:39 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v12 0/6] HDCP2.2 Phase II
Message-ID: <20190806102939.GA2096@intel.com>
References: <20190801114119.28830-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801114119.28830-1-ramalingam.c@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0wMSBhdCAxNzoxMToxMyArMDUzMCwgUmFtYWxpbmdhbSBDIHdyb3RlOgo+IFNl
cmllcyBhZGRzIHRoZSBjb250ZW50X3R5cGUgc3VwcG9ydCBmb3IgSERDUDIuMi4gQWxvbmcgd2l0
aCB0aGF0IHVldmVudAo+IGlzIHNlbnQgZm9yIGVhY2ggSERDUCBzdGF0ZSBjaGFuZ2UgdHJpZ2dl
cmVkIHdpdGhpbiBrZXJuZWwuCj4gCj4gUGVra2EgaGF2ZSBjb21wbGV0ZWQgdGhlIFdlc3RvbiBE
Uk0tYmFja2VuZCByZXZpZXcgaW4KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5
bGFuZC93ZXN0b24vbWVyZ2VfcmVxdWVzdHMvNDgKPiBhbmQgdGhlIFVBUEkgZm9yIEhEQ1AgMi4y
IGxvb2tzIGdvb2QuCj4gCj4gVGhlIHVzZXJzcGFjZSBpcyBhY2NlcHRlZCBpbiBXZXN0b24uCj4g
Cj4gdjEyOgo+ICAgRFJNX01PREVfSERDUF9DT05URU5UX1RZUEV4IGRlZmluaXRpb24gYXJlIG1v
dmVkIGludG8gZHJtX2hkY3AuaAo+IFtwZWtrYV0KPiAgIFBpY2tlZCBBY2tlZC1ieSBhbmQgUi1i
eSBmcm9tIHJldmlld2Vycy4KTWVyZ2VkIHRoaXMgc2VyaWVzIGludG8gZHJtLW1pc2MtbmV4dC4g
VGhhbmtzIGZvciB0aGUgcmV2aWV3ZXMhCgpCUiwKLVJhbS4KPiAKPiBUZXN0LXdpdGg6IDwyMDE5
MDcwMzA5NTQ0Ni4xNDA5Mi0yLXJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gCj4gUmFtYWxpbmdh
bSBDICg2KToKPiAgIGRybTogQWRkIENvbnRlbnQgcHJvdGVjdGlvbiB0eXBlIHByb3BlcnR5Cj4g
ICBkcm0vaTkxNTogQXR0YWNoIGNvbnRlbnQgdHlwZSBwcm9wZXJ0eQo+ICAgZHJtOiB1ZXZlbnQg
Zm9yIGNvbm5lY3RvciBzdGF0dXMgY2hhbmdlCj4gICBkcm0vaGRjcDogdXBkYXRlIGNvbnRlbnQg
cHJvdGVjdGlvbiBwcm9wZXJ0eSB3aXRoIHVldmVudAo+ICAgZHJtL2k5MTU6IHVwZGF0ZSB0aGUg
aGRjcCBzdGF0ZSB3aXRoIHVldmVudAo+ICAgZHJtL2hkY3A6IHJlZmVyZW5jZSBmb3Igc3JtIGZp
bGUgZm9ybWF0Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyAgICAgICAg
IHwgIDQgKysKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgICAgfCA2
OCArKysrKysrKysrKysrKysrKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYyAgICAg
ICAgICAgICAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3lzZnMuYyAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysKPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyAgfCAzOSArKysrKysrKysrLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgfCA1MyArKysrKysrKysrLS0t
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5oIHwgIDIgKy0K
PiAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAgfCAgNyArKysKPiAg
aW5jbHVkZS9kcm0vZHJtX2hkY3AuaCAgICAgICAgICAgICAgICAgICAgfCAgOSArKy0KPiAgaW5j
bHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgICAgICAgICAgfCAgNiArKwo+ICBpbmNsdWRl
L2RybS9kcm1fc3lzZnMuaCAgICAgICAgICAgICAgICAgICB8ICA1ICstCj4gIDExIGZpbGVzIGNo
YW5nZWQsIDI3MSBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjE5
LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
