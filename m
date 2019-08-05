Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE6813E5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBA56E2B8;
	Mon,  5 Aug 2019 08:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87706E2B8;
 Mon,  5 Aug 2019 08:04:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 01:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="192361845"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2019 01:04:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v12 0/6] HDCP2.2 Phase II
In-Reply-To: <20190801114119.28830-1-ramalingam.c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190801114119.28830-1-ramalingam.c@intel.com>
Date: Mon, 05 Aug 2019 11:09:11 +0300
Message-ID: <87d0hkkp94.fsf@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwMSBBdWcgMjAxOSwgUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29t
PiB3cm90ZToKPiBTZXJpZXMgYWRkcyB0aGUgY29udGVudF90eXBlIHN1cHBvcnQgZm9yIEhEQ1Ay
LjIuIEFsb25nIHdpdGggdGhhdCB1ZXZlbnQKPiBpcyBzZW50IGZvciBlYWNoIEhEQ1Agc3RhdGUg
Y2hhbmdlIHRyaWdnZXJlZCB3aXRoaW4ga2VybmVsLgoKQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+CgpGb3IgbWVyZ2luZyB0aGUgaTkxNSBzcGVjaWZpYyBwYXJ0
cyB2aWEgZHJtLW1pc2MgYWxvbmcgdGhlIHJlc3Qgb2YgdGhlCnBhdGNoZXMuCgo+Cj4gUGVra2Eg
aGF2ZSBjb21wbGV0ZWQgdGhlIFdlc3RvbiBEUk0tYmFja2VuZCByZXZpZXcgaW4KPiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vbWVyZ2VfcmVxdWVzdHMvNDgK
PiBhbmQgdGhlIFVBUEkgZm9yIEhEQ1AgMi4yIGxvb2tzIGdvb2QuCj4KPiBUaGUgdXNlcnNwYWNl
IGlzIGFjY2VwdGVkIGluIFdlc3Rvbi4KPgo+IHYxMjoKPiAgIERSTV9NT0RFX0hEQ1BfQ09OVEVO
VF9UWVBFeCBkZWZpbml0aW9uIGFyZSBtb3ZlZCBpbnRvIGRybV9oZGNwLmgKPiBbcGVra2FdCj4g
ICBQaWNrZWQgQWNrZWQtYnkgYW5kIFItYnkgZnJvbSByZXZpZXdlcnMuCj4KPiBUZXN0LXdpdGg6
IDwyMDE5MDcwMzA5NTQ0Ni4xNDA5Mi0yLXJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4KPiBSYW1h
bGluZ2FtIEMgKDYpOgo+ICAgZHJtOiBBZGQgQ29udGVudCBwcm90ZWN0aW9uIHR5cGUgcHJvcGVy
dHkKPiAgIGRybS9pOTE1OiBBdHRhY2ggY29udGVudCB0eXBlIHByb3BlcnR5Cj4gICBkcm06IHVl
dmVudCBmb3IgY29ubmVjdG9yIHN0YXR1cyBjaGFuZ2UKPiAgIGRybS9oZGNwOiB1cGRhdGUgY29u
dGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IHdpdGggdWV2ZW50Cj4gICBkcm0vaTkxNTogdXBkYXRl
IHRoZSBoZGNwIHN0YXRlIHdpdGggdWV2ZW50Cj4gICBkcm0vaGRjcDogcmVmZXJlbmNlIGZvciBz
cm0gZmlsZSBmb3JtYXQKPgo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgICAg
ICAgICB8ICA0ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgICAgICAgICAg
IHwgNjggKysrKysrKysrKysrKysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMg
ICAgICAgICAgICAgICAgfCA3NyArKysrKysrKysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX3N5c2ZzLmMgICAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysrCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgIHwgMzkgKysrKysrKysrKy0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRjcC5jIHwgNTMgKysrKysrKysr
Ky0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3AuaCB8ICAy
ICstCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAgIHwgIDcgKysr
Cj4gIGluY2x1ZGUvZHJtL2RybV9oZGNwLmggICAgICAgICAgICAgICAgICAgIHwgIDkgKystCj4g
IGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAgICAgICAgIHwgIDYgKysKPiAgaW5j
bHVkZS9kcm0vZHJtX3N5c2ZzLmggICAgICAgICAgICAgICAgICAgfCAgNSArLQo+ICAxMSBmaWxl
cyBjaGFuZ2VkLCAyNzEgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgotLSAKSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
