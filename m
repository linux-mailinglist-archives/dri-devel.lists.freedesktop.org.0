Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6833BA95
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 15:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF01089DB5;
	Mon, 15 Mar 2021 14:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B1E89DB5;
 Mon, 15 Mar 2021 14:11:05 +0000 (UTC)
IronPort-SDR: v8trApa8u77eLfD5F8yV0ByOdZtheZRhdy+ss8AUFznDiZZ8pezRh75xipB8jH8SoNFTpKi7tr
 wXtZDZ2472BQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="250458373"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="250458373"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 07:11:04 -0700
IronPort-SDR: cDoyG6rbCKTgvmiyyoPK90V3im5aYfw+1pnxuY0SL4cm1pNfAPNcAwDzO2U6lkAbtgE8YwDyDw
 GiE9qvJwF55w==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="411852783"
Received: from januszk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 07:11:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Sean
 Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/dp_link_training: Add newlines
 to debug messages
In-Reply-To: <YEoymIV6CJUtO3EH@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210310214845.29021-1-sean@poorly.run>
 <YEoymIV6CJUtO3EH@intel.com>
Date: Mon, 15 Mar 2021 16:10:58 +0200
Message-ID: <87eeggpkwd.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMSBNYXIgMjAyMSwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgMDQ6NDc6NTZQTSAt
MDUwMCwgU2VhbiBQYXVsIHdyb3RlOgo+PiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KPj4gCj4+IFRoaXMgcGF0Y2ggYWRkcyBzb21lIG5ld2xpbmVzIHdoaWNoIGFyZSBt
aXNzaW5nIGZyb20gZGVidWcgbWVzc2FnZXMuCj4+IFRoaXMgd2lsbCBwcmV2ZW50IGxvZ3MgZnJv
bSBiZWluZyBzdGFja2VkIHVwIGluIGRtZXNnLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQ
YXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMgfCA0ICsrLS0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xpbmtfdHJhaW5pbmcuYwo+
PiBpbmRleCA4OTJkN2RiN2Q5NGYuLmFkMDJkNDkzZWMxNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMKPj4g
QEAgLTI5LDcgKzI5LDcgQEAgc3RhdGljIHZvaWQKPj4gIGludGVsX2RwX2R1bXBfbGlua19zdGF0
dXMoY29uc3QgdTggbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0pCj4+ICB7Cj4+ICAK
Pj4gLQlEUk1fREVCVUdfS01TKCJsbjBfMToweCV4IGxuMl8zOjB4JXggYWxpZ246MHgleCBzaW5r
OjB4JXggYWRqX3JlcTBfMToweCV4IGFkal9yZXEyXzM6MHgleCIsCj4+ICsJRFJNX0RFQlVHX0tN
UygibG4wXzE6MHgleCBsbjJfMzoweCV4IGFsaWduOjB4JXggc2luazoweCV4IGFkal9yZXEwXzE6
MHgleCBhZGpfcmVxMl8zOjB4JXhcbiIsCj4+ICAJCSAgICAgIGxpbmtfc3RhdHVzWzBdLCBsaW5r
X3N0YXR1c1sxXSwgbGlua19zdGF0dXNbMl0sCj4+ICAJCSAgICAgIGxpbmtfc3RhdHVzWzNdLCBs
aW5rX3N0YXR1c1s0XSwgbGlua19zdGF0dXNbNV0pOwo+PiAgfQo+PiBAQCAtNzMxLDcgKzczMSw3
IEBAIGludGVsX2RwX2xpbmtfdHJhaW5fcGh5KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCj4+
ICAKPj4gIG91dDoKPj4gIAlkcm1fZGJnX2ttcygmZHBfdG9faTkxNShpbnRlbF9kcCktPmRybSwK
Pj4gLQkJICAgICJbQ09OTkVDVE9SOiVkOiVzXSBMaW5rIFRyYWluaW5nICVzIGF0IGxpbmsgcmF0
ZSA9ICVkLCBsYW5lIGNvdW50ID0gJWQsIGF0ICVzIiwKPj4gKwkJICAgICJbQ09OTkVDVE9SOiVk
OiVzXSBMaW5rIFRyYWluaW5nICVzIGF0IGxpbmsgcmF0ZSA9ICVkLCBsYW5lIGNvdW50ID0gJWQs
IGF0ICVzXG4iLAo+Cj4gTG9va2luZyB0aHJvdWdoIHNvbWUgY2kgbG9ncyB3ZSBkbyBnZXQgdGhl
IG5ld2xpbmUgaGVyZSBzb21laG93LiBBIGJpdAo+IHdlaXJkLgo+Cj4gUmV2aWV3ZWQtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpUaGFua3MgZm9y
IHRoZSBwYXRjaGVzIGFuZCByZXZpZXcsIHB1c2hlZCB0byBkaW4uCgpCUiwKSmFuaS4KCi0tIApK
YW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
