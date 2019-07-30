Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9450879D29
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 02:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174FE6E2D7;
	Tue, 30 Jul 2019 00:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56A6E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 00:02:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 17:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="190716546"
Received: from ldmartin-desk1.jf.intel.com (HELO ldmartin-desk1)
 ([10.24.10.102])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 17:02:52 -0700
Date: Mon, 29 Jul 2019 17:02:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH libdrm 3/3] intel: Add support for EHL
Message-ID: <20190730000251.vbar3d4jepauisnk@ldmartin-desk1>
References: <20190715185332.10615-1-lucas.demarchi@intel.com>
 <20190715185332.10615-3-lucas.demarchi@intel.com>
 <c57579ff7e23de69dcb6edef54160d2dca504c92.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c57579ff7e23de69dcb6edef54160d2dca504c92.camel@intel.com>
User-Agent: NeoMutt/20180716
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
Cc: "Ausmus, James" <james.ausmus@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6NTI6MzBQTSAtMDcwMCwgSm9zZSBTb3V6YSB3cm90
ZToKPlNlcmllcyBpcyBSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5z
b3V6YUBpbnRlbC5jb20+CgpUaGFua3MsIGFwcGxpZWQuCgpMdWNhcyBEZSBNYXJjaGkKCj4KPk9u
IE1vbiwgMjAxOS0wNy0xNSBhdCAxMTo1MyAtMDcwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOgo+
PiBGcm9tOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4+Cj4+IEFkZCB0
aGUgUENJIElEIGltcG9ydCBmb3IgRUhMLgo+Pgo+PiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdv
LnZpdmlAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBBdXNtdXMgPGphbWVzLmF1
c211c0BpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tPgo+PiAtLS0KPj4gIGludGVsL2ludGVsX2NoaXBzZXQuYyB8IDEg
Kwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9p
bnRlbC9pbnRlbF9jaGlwc2V0LmMgYi9pbnRlbC9pbnRlbF9jaGlwc2V0LmMKPj4gaW5kZXggMTU3
YzJjN2QuLmY2ZTM3ZWU3IDEwMDY0NAo+PiAtLS0gYS9pbnRlbC9pbnRlbF9jaGlwc2V0LmMKPj4g
KysrIGIvaW50ZWwvaW50ZWxfY2hpcHNldC5jCj4+IEBAIC0zNiw2ICszNiw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZSB7Cj4+ICB9IHBjaWlkc1tdID0gewo+PiAgCS8qIEtlZXAg
aWRzIHNvcnRlZCBieSBnZW47IGxhdGVzdCBnZW4gZmlyc3QgKi8KPj4gIAlJTlRFTF9UR0xfMTJf
SURTKDEyKSwKPj4gKwlJTlRFTF9FSExfSURTKDExKSwKPj4gIAlJTlRFTF9JQ0xfMTFfSURTKDEx
KSwKPj4gIAlJTlRFTF9DTkxfSURTKDEwKSwKPj4gIAlJTlRFTF9DRkxfSURTKDkpLApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
