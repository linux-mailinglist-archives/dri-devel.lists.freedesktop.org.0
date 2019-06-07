Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DEE38877
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817B89B9A;
	Fri,  7 Jun 2019 11:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC7489B9A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:04:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 04:04:58 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2019 04:04:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>, Harish
 Chegondi <harish.chegondi@intel.com>
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+),
 providing EDID manually fails
In-Reply-To: <alpine.DEB.2.20.1906041106090.29321@whs-18.cs.helsinki.fi>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
 <878surn919.wl-ashutosh.dixit@intel.com> <87sgsz593p.fsf@intel.com>
 <alpine.DEB.2.20.1905291127350.24401@whs-18.cs.helsinki.fi>
 <878sup5zmh.fsf@intel.com> <20190604061511.GA22758@intel.com>
 <alpine.DEB.2.20.1906041106090.29321@whs-18.cs.helsinki.fi>
Date: Fri, 07 Jun 2019 14:08:00 +0300
Message-ID: <871s051wmn.fsf@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNCBKdW4gMjAxOSwgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AY3MuaGVs
c2lua2kuZmk+IHdyb3RlOgo+IFllcywgaWYgaXQgYXBwbGllcyBmaW5lIHRvIDUuMS4gLi4uQWxz
bywgaXQgd2lsbCB0YWtlIGEgd2VlayBvciBzby4KClBsZWFzZSB0cnkgdGhlc2UgdHdvIHBhdGNo
ZXMgaW5zdGVhZDoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MTc2
NC8KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhp
Y3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
