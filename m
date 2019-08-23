Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E599B64C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 20:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE36ED1A;
	Fri, 23 Aug 2019 18:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34906ED17;
 Fri, 23 Aug 2019 18:41:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 11:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="173561319"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 23 Aug 2019 11:41:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Aug 2019 21:41:41 +0300
Date: Fri, 23 Aug 2019 21:41:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <waynelin@amd.com>
Subject: Re: [PATCH] drm/drm_connector: add additional aspect ratio values
Message-ID: <20190823184141.GW5942@intel.com>
References: <20190822215002.17836-1-waynelin@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822215002.17836-1-waynelin@amd.com>
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
Cc: Sunpeng.Li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDU6NTA6MDJQTSAtMDQwMCwgV2F5bmUgTGluIHdyb3Rl
Ogo+IEZvciBIRE1JMi4wIENUUyBpdGVtIC0gSEYxLTM1LCBpdCB2ZXJpZmllcyBpZiB0aGUgc291
cmNlIGdlbmVyYXRlcwo+IHZpZGVvIHRpbWluZyAiNjQ6MjciIHZpZGVvIGZvcm1hdCBjb3JyZWN0
bHkuCj4gCj4gZWc6ICh2aWMtNzYpIDE5MjB4MTA4MHBANjBIeiwyNGJwcAo+IAo+IFRoaXMgcGF0
Y2ggYWRkIG9uICI2NDoyNyIgYW5kICIyNTY6MTM1IiB0byBkcm1fYXNwZWN0X3JhdGlvX2VudW1f
bGlzdC4KPiBUaGVyZWFmdGVyLCBvbmUgY2FuIHNwZWNpZnkgdGhlIGFzcGVjdCByYXRpbyB0byAi
NjQ6MjciIG9yICIyNTY6MTM1Igo+IGFmdGVyIGNyZWF0aW5nIGFzcGVjdCByYXRpbyBwcm9wZXJ0
eS4KPiAKPiBDaGFuZ2UtSWQ6IElmYzlkZjU0ZThlOGY3OGU3MDk2MGZjZDczN2EzYTU3ZTQ5Yzgx
MTUyCj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDx3YXluZWxpbkBhbWQuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gaW5kZXggM2Ew
Y2FjYjcxMjM1Li5jMDYyOWEwMWQwOGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiBA
QCAtNzcyLDYgKzc3Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9saXN0
IGRybV9hc3BlY3RfcmF0aW9fZW51bV9saXN0W10gPSB7Cj4gIAl7IERSTV9NT0RFX1BJQ1RVUkVf
QVNQRUNUX05PTkUsICJBdXRvbWF0aWMiIH0sCj4gIAl7IERSTV9NT0RFX1BJQ1RVUkVfQVNQRUNU
XzRfMywgIjQ6MyIgfSwKPiAgCXsgRFJNX01PREVfUElDVFVSRV9BU1BFQ1RfMTZfOSwgIjE2Ojki
IH0sCj4gKwl7IERSTV9NT0RFX1BJQ1RVUkVfQVNQRUNUXzY0XzI3LCAiNjQ6MjciIH0sCj4gKwl7
IERSTV9NT0RFX1BJQ1RVUkVfQVNQRUNUXzI1Nl8xMzUsICIyNTY6MTM1IiB9LAoKTm90IDEwMCUg
c3VyZSB3ZSB3YW50IHRvIGV4cG9zZSB0aGVzZSB2aWEgdGhlIHByb3BlcnR5IGJlY2F1c2UgdGhl
CmluZm9mcmFtZSBjYW4ndCBjb252ZXkgdGhlc2UgaW5kZXBlbmRlbnRseSBmcm9tIHRoZSBWSUMu
Cgo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgZHJt
X2NvbnRlbnRfdHlwZV9lbnVtX2xpc3RbXSA9IHsKPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
