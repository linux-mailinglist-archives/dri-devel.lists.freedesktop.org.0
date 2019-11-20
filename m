Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E07103CE9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 15:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB336EA5A;
	Wed, 20 Nov 2019 14:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373976EA50;
 Wed, 20 Nov 2019 14:04:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 06:04:28 -0800
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="200725213"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 06:04:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PULL] topic/drm-mipi-dsi-dsc-updates
In-Reply-To: <44c6a588-af34-2acd-40b3-b9d82c35226b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87tv7a4eq3.fsf@intel.com> <87v9rm1q63.fsf@intel.com>
 <44c6a588-af34-2acd-40b3-b9d82c35226b@linux.intel.com>
Date: Wed, 20 Nov 2019 16:04:22 +0200
Message-ID: <877e3uy789.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Simha BN <simhavcs@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBOb3YgMjAxOSwgTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT3AgMTQtMTEtMjAxOSBvbSAxNTozNSBzY2hyZWVm
IEphbmkgTmlrdWxhOgo+PiBPbiBNb24sIDExIE5vdiAyMDE5LCBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAaW50ZWwuY29tPiB3cm90ZToKPj4+IEhpIFNlYW4sIE1hYXJ0ZW4gYW5kIE1heGltZSAt
Cj4+Pgo+Pj4gSGVyZSdzIHRoZSB0b3BpYyBicmFuY2ggYWJvdXQgRFNJIGNoYW5nZXMgYXMgSSB3
cm90ZSBpbiBbMV0uIE9uY2UgeW91J3ZlCj4+PiBwdWxsZWQgdGhpcyBpbiBkcm0tbWlzYywgSSds
bCBmb2xsb3cgc3VpdCBpbiBpOTE1Lgo+PiBQaW5nLgo+Pgo+PiBGV0lXIERhbmllbCBhY2tlZCB0
aGUgYXBwcm9hY2ggb24gSVJDLgo+Pgo+PiBCUiwKPj4gSmFuaS4KPj4KPj4KPiBQdXNoZWQsIHRo
YW5rcy4gOikKClRoYW5rczsgYWxzbyBwdWxsZWQgdG8gZHJtLWludGVsLW5leHQtcXVldWVkIG5v
dy4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhp
Y3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
