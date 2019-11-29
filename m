Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947F10D7A5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CBB6E922;
	Fri, 29 Nov 2019 15:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22D36E922;
 Fri, 29 Nov 2019 15:08:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 07:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="203761491"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 29 Nov 2019 07:08:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Nov 2019 17:08:45 +0200
Date: Fri, 29 Nov 2019 17:08:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH V2 1/2] drm/edid: Add aspect ratios to HDMI 4K modes
Message-ID: <20191129150845.GF1208@intel.com>
References: <20191118101832.15487-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118101832.15487-1-Wayne.Lin@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDY6MTg6MzFQTSArMDgwMCwgV2F5bmUgTGluIHdyb3Rl
Ogo+IFtXaHldCj4gSERNSSAyLjAgYWRkcyBhc3BlY3QgcmF0aW8gYXR0cmlidXRlIHRvIGRpc3Rp
bmd1aXNoIGRpZmZlcmVudAo+IDRrIG1vZGVzLiBBY2NvcmRpbmcgdG8gQXBwZW5kaXggRSBvZiBI
RE1JIDIuMCBzcGVjLCBzb3VyY2Ugc2hvdWxkCj4gdXNlIFZTSUYgdG8gaW5kaWNhdGUgdmlkZW8g
bW9kZSBvbmx5IHdoZW4gdGhlIG1vZGUgaXMgb25lIGRlZmluZWQKPiBpbiBIRE1JIDEuNGIgNEsg
bW9kZXMuIE90aGVyd2lzZSwgdXNlIEFWSSBpbmZvZnJhbWVzIHRvIGNvbnZleSBWSUMuCj4gCj4g
Q3VycmVudCBjb2RlIGRvZXNuJ3QgdGFrZSBhc3BlY3QgcmF0aW8gaW50byBjb25zaWRlcmF0aW9u
IHdoaWxlCj4gY29uc3RydWN0aW5nIGF2aSBpbmZvZnJhbWUuIFNob3VsZCBtb2RpZnkgdGhhdC4K
PiAKPiBbSG93XQo+IEluaGVyaXQgVmlsbGUgU3lyasOkbMOkJ3Mgd29yawo+ICJkcm0vZWRpZDog
UHJlcCBmb3IgSERNSSBWSUMgYXNwZWN0IHJhdGlvIiBhdAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTExNzQ2MzkvCj4gCj4gQWRkIHBpY3R1cmVfYXNwZWN0X3JhdGlvIGF0
dHJpYnV0ZXMgdG8gZWRpZF80a19tb2Rlc1tdIGFuZAo+IGNvbnN0cnVjdCBWSUMgYW5kIEhETUlf
VklDIGJ5IHRha2luZyBhc3BlY3QgcmF0aW8gaW50bwo+IGNvbnNpZGVyYXRpb24uCj4gCj4gdjI6
IENvcnJlY3QgbWlzc2luZyBpbml0aWFsaXplciBlcnJvciBhdCBhZGRpbmcgYXNwZWN0IHJhdGlv
IG9mIAo+IFNNUFRFIG1vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXluZS5M
aW5AYW1kLmNvbT4KCk91ciBDSSBkaWRuJ3QgY29tcGxhaW4gYWJvdXQgYW55dGhpbmcgdGhhdCBs
b29rZWQgcmVsZXZhbnQsCnNvIEkgd2VudCBhaGVhZCBhbiBwdXNoZWQgdGhlc2UgdG8gZHJtLW1p
c2MtbmV4dC4KClRoYW5rcyBmb3IgdGhlIHBhdGNoZXMuCgotLSAKVmlsbGUgU3lyasOkbMOkCklu
dGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
