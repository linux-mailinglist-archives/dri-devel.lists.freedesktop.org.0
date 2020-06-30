Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B401720F6ED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 16:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905CC8915B;
	Tue, 30 Jun 2020 14:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B328915B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:15:08 +0000 (UTC)
IronPort-SDR: UDHegUanv6/Si9f9jOx0tY4ssAQYgaTvofnU6ykiLtLfPGuR1WCDYHp2iTSD40trvRJAeohLOm
 Vest3gWHmmBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="145313653"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="145313653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 07:15:07 -0700
IronPort-SDR: KZKjf4hRgtnhCk1maQEop5U6GCJE8U3zY7e2VBz7+jmyj9WFCeo2nE1xHJzRwynNZ0M/d7KVQI
 CMCTk7jCw8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="320940115"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 30 Jun 2020 07:15:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Jun 2020 17:15:05 +0300
Date: Tue, 30 Jun 2020 17:15:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: warning in omap_connector
Message-ID: <20200630141505.GE6112@intel.com>
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMDQ6MzM6MzdQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gSGV5IExhdXJlbnQsCj4gCj4gSSBtZXJnZWQgZHJtLW1pc2MtbmV4dCBhbmQgbm90aWNl
ZCB0aGlzLCBJJ20gbm90IHN1cmUgaWYgaXQncwo+IGNvbGxhdGVyYWwgZGFtYWdlIGZyb20gc29t
ZXRoaW5nIGVsc2UgY2hhbmdpbmcgb3IgSSd2ZSBqdXN0IG1pc3NlZCBpdAo+IHByZXZpb3VzbHku
IDMyLWJpdCBhcm0gYnVpbGQuCj4gCj4gCj4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGlt
L3NyYy9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jOgo+IEluIGZ1bmN0
aW9uIOKAmG9tYXBfY29ubmVjdG9yX21vZGVfdmFsaWTigJk6Cj4gL2hvbWUvYWlybGllZC9kZXZl
bC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5j
OjkyOjk6Cj4gd2FybmluZzogYnJhY2VzIGFyb3VuZCBzY2FsYXIgaW5pdGlhbGl6ZXIKPiAgIHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlIG5ld19tb2RlID0geyB7IDAgfSB9OwoKUHJvYmFibHkgZmFs
bG91dCBmcm9tIG15IGRybV9kaXNwbGF5X21vZGUgc2hyaW5rYWdlLgoKR29pbmcgdG8gcmVwZWF0
IG15IHVzdWFsICJqdXN0IHVzZSB7fSB3aGVuIHplcm8gaW5pdGlhbGl6aW5nCnN0cnVjdHMiIHJl
Y29tbWVuZGF0aW9uLiBBdm9pZHMgdGhlc2Ugc3R1cGlkIHdhcm5pbmdzLCBhbmQgSU1PCmFsc28g
Y29udmV5cyB0aGUgbWVhbmluZyBiZXR0ZXIgc2luY2UgdGhlcmUncyBubyBhbWJpZ3VpdHkKYmV0
d2VlbiB6ZXJvIGluaXRpYWxpemluZyB0aGUgd2hvbGUgc3RydWN0IHZzLiB6ZXJvIGluaXRpYWxp
emluZwpqdXN0IHRoZSBmaXJzdCBtZW1iZXIuCgo+ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4K
PiAvaG9tZS9haXJsaWVkL2RldmVsL2tlcm5lbC9kaW0vc3JjL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfY29ubmVjdG9yLmM6OTI6OToKPiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBm
b3Ig4oCYbmV3X21vZGUuY2xvY2vigJkpCj4gCj4gRGF2ZS4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
