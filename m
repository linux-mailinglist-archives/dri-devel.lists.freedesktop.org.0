Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F24D5E02
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D1F6E152;
	Mon, 14 Oct 2019 08:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF4C6E14D;
 Mon, 14 Oct 2019 08:58:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 01:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; d="scan'208";a="207929957"
Received: from vkuppusa-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.39.77])
 by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2019 01:58:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Changbin Du <changbin.du@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] kernel-doc: rename the kernel-doc directive 'functions'
 to 'specific'
In-Reply-To: <20191013055359.23312-1-changbin.du@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191013055359.23312-1-changbin.du@gmail.com>
Date: Mon, 14 Oct 2019 11:59:37 +0300
Message-ID: <875zkrd7nq.fsf@intel.com>
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
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, linux-kselftest@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAxMyBPY3QgMjAxOSwgQ2hhbmdiaW4gRHUgPGNoYW5nYmluLmR1QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gVGhlICdmdW5jdGlvbnMnIGRpcmVjdGl2ZSBpcyBub3Qgb25seSBmb3IgZnVuY3Rp
b25zLCBidXQgYWxzbyB3b3JrcyBmb3IKPiBzdHJ1Y3RzL3VuaW9ucy4gU28gdGhlIG5hbWUgaXMg
bWlzbGVhZGluZy4gVGhpcyBwYXRjaCByZW5hbWVzIGl0IHRvCj4gJ3NwZWNpZmljJywgc28gbm93
IHdlIGhhdmUgZXhwb3J0L2ludGVybmFsL3NwZWNpZmljIGRpcmVjdGl2ZXMgdG8gbGltaXQKPiB0
aGUgZnVuY3Rpb25zL3R5cGVzIHRvIGJlIGluY2x1ZGVkIGluIGRvY3VtZW50YXRpb24uIE1lYW53
aGlsZSB3ZSBpbXByb3ZlZAo+IHRoZSB3YXJuaW5nIG1lc3NhZ2UuCgpBZ3JlZWQgb24gImZ1bmN0
aW9ucyIgYmVpbmcgbGVzcyB0aGFuIHBlcmZlY3QuIEl0IGRpcmVjdGx5IGV4cG9zZXMgdGhlCmlk
aW9zeW5jcmFzaWVzIG9mIHNjcmlwdHMva2VybmVsLWRvYy4gSSdtIG5vdCBzdXJlICJzcGVjaWZp
YyIgaXMgYW55CmJldHRlciwgdGhvdWdoLgoKUGVyaGFwcyAic3ltYm9scyIgd291bGQgYmUgbW9y
ZSBzZWxmLWV4cGxhbmF0b3J5LiBPciwgYWN0dWFsbHkgbWFrZQoiZnVuY3Rpb25zIiBvbmx5IHdv
cmsgb24gZnVuY3Rpb25zLCBhbmQgYWRkIGEgc2VwYXJhdGUga2V5d29yZCBmb3Igb3RoZXIKc3R1
ZmYuICpzaHJ1ZyoKClNlZW1zIGxpa2UgdGhlIHBhdGNoIGlzIHdheSB0b28gYmlnLiBJJ2QgcHJv
YmFibHkgYWRkICJzeW1ib2xzIiAob3IKd2hhdGV2ZXIpIGFzIGEgc3lub255bSBmb3IgImZ1bmN0
aW9ucyIgZm9yIHN0YXJ0ZXJzLCBhbmQgY29udmVydApkb2N1bWVudHMgcGllY2VtZWFsLCBhbmQg
ZmluYWxseSBkcm9wIHRoZSBvbGQgb25lLgoKVGhlIHNjcmlwdHMva2VybmVsLWRvYyBjaGFuZ2Ug
c2hvdWxkIGJlIGEgcGF0Y2ggb2YgaXRzIG93bi4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3Vs
YSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
