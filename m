Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8BE0123
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 11:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1486E4F1;
	Tue, 22 Oct 2019 09:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC346E4F1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:51:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 02:51:06 -0700
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="191410043"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 02:51:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
In-Reply-To: <20191022084423.GB1531961@ulmo>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
 <87lftdfb4c.fsf@intel.com> <20191022084423.GB1531961@ulmo>
Date: Tue, 22 Oct 2019 12:51:00 +0300
Message-ID: <87imohf6rf.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBPY3QgMjAxOSwgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6MTY6NTFBTSArMDMwMCwg
SmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIFdlZCwgMTYgT2N0IDIwMTksIFBhdHJpayBKYWtvYnNz
b24gPHBhdHJpay5yLmpha29ic3NvbkBnbWFpbC5jb20+IHdyb3RlOgo+PiA+IEZpeCB0eXBvIHdo
ZXJlIGJpdHMgZ290IGNvbXBhcmVkICh4IDwgeSkgaW5zdGVhZCBvZiBzaGlmdGVkICh4IDw8IHkp
Lgo+PiAKPj4gRml4ZXM6IDNhZDMzYWUyYmM4MCAoImRybTogQWRkIFNDREMgaGVscGVycyIpCj4+
IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+Cj4gSSdtIG5vdCBzdXJl
IHdlIHJlYWxseSBuZWVkIHRoZSBGaXhlczogdGFnIGhlcmUuIFRoZXNlIGRlZmluZXMgYXJlbid0
Cj4gdXNlZCBhbnl3aGVyZSwgc28gdGVjaG5pY2FsbHkgdGhlcmUncyBubyBidWcuCgpZZWFoIHdl
bGwsIEkganVzdCBsb2dnZWQgaXQgaGVyZSBhcyBJIGhhcHBlbmVkIHRvIGRvIHRoZSBkcml2ZS1i
eSBnaXQKYmxhbWUuCgpCUiwKSmFuaS4KCgoKPgo+IFRoaWVycnkKPgo+PiAKPj4gPiBTaWduZWQt
b2ZmLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPgo+
PiA+IC0tLQo+PiA+ICBpbmNsdWRlL2RybS9kcm1fc2NkY19oZWxwZXIuaCB8IDYgKysrLS0tCj4+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+ID4K
Pj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fc2NkY19oZWxwZXIuaAo+PiA+IGluZGV4IGY5MmViMjA5NGQ2Yi4uNmE0ODM1MzNh
YWU0IDEwMDY0NAo+PiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9zY2RjX2hlbHBlci5oCj4+ID4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3NjZGNfaGVscGVyLmgKPj4gPiBAQCAtNTAsOSArNTAsOSBA
QAo+PiA+ICAjZGVmaW5lICBTQ0RDX1JFQURfUkVRVUVTVF9FTkFCTEUgKDEgPDwgMCkKPj4gPiAg
Cj4+ID4gICNkZWZpbmUgU0NEQ19TVEFUVVNfRkxBR1NfMCAweDQwCj4+ID4gLSNkZWZpbmUgIFND
RENfQ0gyX0xPQ0sgKDEgPCAzKQo+PiA+IC0jZGVmaW5lICBTQ0RDX0NIMV9MT0NLICgxIDwgMikK
Pj4gPiAtI2RlZmluZSAgU0NEQ19DSDBfTE9DSyAoMSA8IDEpCj4+ID4gKyNkZWZpbmUgIFNDRENf
Q0gyX0xPQ0sgKDEgPDwgMykKPj4gPiArI2RlZmluZSAgU0NEQ19DSDFfTE9DSyAoMSA8PCAyKQo+
PiA+ICsjZGVmaW5lICBTQ0RDX0NIMF9MT0NLICgxIDw8IDEpCj4+ID4gICNkZWZpbmUgIFNDRENf
Q0hfTE9DS19NQVNLIChTQ0RDX0NIMl9MT0NLIHwgU0NEQ19DSDFfTE9DSyB8IFNDRENfQ0gwX0xP
Q0spCj4+ID4gICNkZWZpbmUgIFNDRENfQ0xPQ0tfREVURUNUICgxIDw8IDApCj4+IAo+PiAtLSAK
Pj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApK
YW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
