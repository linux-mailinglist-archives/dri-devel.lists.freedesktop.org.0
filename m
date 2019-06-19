Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90E4C22F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 22:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF9D6E384;
	Wed, 19 Jun 2019 20:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178F6E384
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 20:16:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 13:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,394,1557212400"; d="scan'208";a="181705592"
Received: from cussonne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.34.121])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2019 13:16:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Subject: Re: KMS documentation for userspace
In-Reply-To: <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
 <CAKMK7uH7Twme7kn==ZXeCuC5+uL0RAm9fv2KJui=KATZwLHuqw@mail.gmail.com>
Date: Wed, 19 Jun 2019 23:18:28 +0300
Message-ID: <87fto5pbvv.fsf@intel.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiAtIGZpZ3VyZSBvdXQgd2hhdCB0byBkbyB3aXRoIHRoZSBsaWJkcm0gbWFucGFnZXMuIFNv
bWUgc3R1ZmYgd2UgcmVhbGx5Cj4gd2FudCB0byBhbHNvIGRvY3VtZW50IHRoZXJlLiBCdXQgZ2Vl
eiBucm9mZi4gTWF5YmUgd2UgbmVlZCB0byBzdHVmZgo+IGxpYmRybSBpbnRvIHRoZSBrZXJuZWws
IGR1bm5vLgoKSG93IHdvdWxkIHBlb3BsZSBmZWVsIGFib3V0IGNvbnZlcnRpbmcgbGliZHJtIG1h
biBwYWdlcyB0byByc3QsIGFuZAp1c2luZyByc3QybWFuIGluIHRoZSBidWlsZD8gV2UgZGlkIHRo
YXQgZm9yIGlndCBtYW4gcGFnZXMgWzFdLiBMb29raW5nCmF0IHRoZSBkaWZmLCBJIHRoaW5rIGl0
J3MgcGxhaW4gdG8gc2VlIGhvdyB0aGF0IGNvdWxkIGxvd2VyIHRoZSBiYXIgZm9yCmNvbnRyaWJ1
dGluZy4gQW5kIHBlcmhhcHMgaXQgd291bGQgYmUgZWFzaWVyIHRvIHJlZmFjdG9yIGFuZCBtb3Zl
CmRvY3VtZW50YXRpb24gYXJvdW5kIHRvby4KCkkgZm9yZ2V0LCBJIHByb2JhYmx5IHVzZWQgcGFu
ZG9jIG9yIHNvbWV0aGluZyB0byBkbyB0aGUgYnVsayBvZiB0aGUgaWd0CmNvbnZlcnNpb24sIGFu
ZCBhZGRlZCBzb21lIG1hbnVhbCBwb2xpc2ggb24gdG9wLiBJJ20gbm90IHZvbHVudGVlcmluZwpm
b3IgdGhlIGxpYmRybSBtYW4gcGFnZSBjb252ZXJzaW9uIHRob3VnaC4gOykKCkJSLApKYW5pLgoK
ClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvY29t
bWl0L2NjNzM4N2YxN2NlNTc1MGZjNjQwMzU1ZDk0ZWQ2MGI2OTM2YzJkN2IKCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
