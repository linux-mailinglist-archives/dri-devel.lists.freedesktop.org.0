Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8424AA4
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0C89206;
	Tue, 21 May 2019 08:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01D89206
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:44:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 01:44:38 -0700
X-ExtLoop1: 1
Received: from lfo1-mobl.ger.corp.intel.com (HELO [10.252.22.14])
 ([10.252.22.14])
 by orsmga003.jf.intel.com with ESMTP; 21 May 2019 01:44:36 -0700
Subject: Re: drm-sync timeline signaling
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
References: <882a793c-cf49-8522-b1f3-cdb8dc685ea0@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <2e74c0a7-3b4e-c1ff-9b6c-33ebd7008b6b@intel.com>
Date: Tue, 21 May 2019 09:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <882a793c-cf49-8522-b1f3-cdb8dc685ea0@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8KCk9uIDE2LzA1LzIwMTkgMTU6NDksIExpb25lbCBMYW5kd2VybGluIHdyb3RlOgo+IEhp
IGFsbCwKPgo+IFdoaWxlIHBpY2tpbmcgdXAgdGhlIElHVCB0ZXN0cyBmb3IgdGltZWxpbmUgc3lu
Y29iaiwKPiBJIG5vdGljZWQgdGhhdCBhbHRob3VnaCB3ZSBkZWFsIHdpdGggbXVsdGkgd2FpdCBh
Y3Jvc3MgYm90aCB0aW1lbGluZSAKPiAod2l0aCBwb2ludCB2YWx1ZSA+IDApIGFuZCBiaW5hcnkg
KHBvaW50IHZhbHVlID0gMCkgc3luY29ianMsCj4gd2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGEgc2lt
aWxhciBiZWhhdmlvciB3aXRoIHNpZ25hbGluZy4KPgo+IERvIHlvdSBoYXZlIGFueSB0aG91Z2h0
IG9uIHRoaXM/Cj4gSSdtIGNvbnNpZGVyaW5nIHdyaXRpbmcgc29tZSBkb2NzIGJ1dCBJJ20gbm90
IHF1aXRlIHN1cmUgd2hldGhlciB0aGlzIAo+IGRpZmZlcmVuY2UgYmV0d2VlbiBzaWduYWxpbmcv
d2FpdGluZyB3YXMgaW50ZW50aW9uYWwgb3IganVzdCBvdmVybG9va2VkLgo+Cj4gVGhhbmtzLAo+
Cj4gLUxpb25lbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
