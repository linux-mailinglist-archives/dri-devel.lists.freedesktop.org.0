Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B84590C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A99893A8;
	Fri, 14 Jun 2019 09:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E830C8933C;
 Fri, 14 Jun 2019 09:43:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 02:43:49 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2019 02:43:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Huckleberry <nhuck@google.com>, jsanka@codeaurora.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
In-Reply-To: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
Date: Fri, 14 Jun 2019 12:46:44 +0300
Message-ID: <875zp8wlbv.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgTmF0aGFuIEh1Y2tsZWJlcnJ5IDxuaHVja0Bnb29nbGUuY29t
PiB3cm90ZToKPiBIZXkgYWxsLAo+Cj4gSSdtIGxvb2tpbmcgaW50byBjbGVhbmluZyB1cCBpZ25v
cmVkIHdhcm5pbmdzIGluIHRoZSBrZXJuZWwgc28gd2UgY2FuCj4gcmVtb3ZlIGNvbXBpbGVyIGZs
YWdzIHRvIGlnbm9yZSB3YXJuaW5ncy4KCldob2xlaGVhcnRlZGx5IGFncmVlZCBvbiB0aGUgZ29h
bC4KCj4gVGhlcmUgYXJlIHNldmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9ybWF0cy5j
Cj4gKCdkcHVfZm9ybWF0X21hcF90aWxlJywgJ2RwdV9mb3JtYXRfbWFwX3AwMTAnLAo+ICdkcHVf
Zm9ybWF0X21hcF9wMDEwX3Vid2MnLCAnZHB1X2Zvcm1hdF9tYXBfdHAxMF91YndjJykuCj4gVGhl
eSBsb29rIGxpa2UgbW9kaWZpZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1lbnRlZC4gSSdkIGxp
a2UgdG8KPiByZW1vdmUgdGhlc2UgdmFyaWFibGVzIGlmIHRoZXJlIGFyZSBubyBwbGFucyBtb3Zp
bmcgZm9yd2FyZCB0bwo+IGltcGxlbWVudCB0aGVtLiBPdGhlcndpc2UgSSdsbCBqdXN0IGxlYXZl
IHRoZW0uCj4KPiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vl
cy81MjgKCk5vIG9waW5pb24gb24gdGhlIHNhaWQgdmFyaWFibGVzIGFib3ZlLCBidXQsIEZXSVcs
IHBlcnNvbmFsbHkgSSB0aGluawppdCdzIGZpbmUgdG8gYWRkIHRoZSBjZmxhZ3MgdG8gc3VwcmVz
cyB3YXJuaW5ncyBsb2NhbGx5IHdoZXJlIG5lZWRlZCBpbgpvcmRlciB0byBiZSBhYmxlIHRvIGFj
aGlldmUgdGhlIGdyZWF0ZXIgZ29hbCBvZiByZW1vdmluZyB0aGUgY2ZsYWdzCmdsb2JhbGx5LgoK
SW4gZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgd2UgYWN0dWFsbHkgZ28gZm9yIG11Y2gg
c3RyaWN0ZXIKd2FybmluZ3MgdGhhbiB0aGUga2VybmVsIGRlZmF1bHRzLCBhbmQgZGlzYWJsZSBh
IG1vcmUgbGltaXRlZCBhbmQKdGFpbG9yZWQgc2V0IG9mIHdhcm5pbmdzLgoKWW91IGNhbiBkbyB0
aGlzIGJvdGggb24gYSBzdWJkaXIgYW5kIGZpbGUgbGV2ZWwgd2l0aCBzdWJkaXItY2NmbGFncy15
CmFuZCBDRkxBR1NfZmlsZW5hbWUubywgcmVzcGVjdGl2ZWx5LgoKQlIsCkphbmkuCgoKLS0gCkph
bmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
