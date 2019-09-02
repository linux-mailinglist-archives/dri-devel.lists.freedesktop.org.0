Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E926A5CF5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17032899D6;
	Mon,  2 Sep 2019 20:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769F489B11
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 13:22:15 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 06:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="181875847"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2019 06:22:13 -0700
Received: from andy by smile with local (Exim 4.92.1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1i4mHc-0002Rl-Hx; Mon, 02 Sep 2019 16:22:12 +0300
Date: Mon, 2 Sep 2019 16:22:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1] backlight: lm3630a: Switch to use
 fwnode_property_count_uXX()
Message-ID: <20190902132212.GL2680@smile.fi.intel.com>
References: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
 <20190812080444.GG4594@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812080444.GG4594@dell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDk6MDQ6NDRBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMjMgSnVsIDIwMTksIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiAKPiA+IFVz
ZSB1c2UgZndub2RlX3Byb3BlcnR5X2NvdW50X3VYWCgpIGRpcmVjdGx5LCB0aGF0IG1ha2VzIGNv
ZGUgbmVhdGVyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2xtMzYzMGFfYmwuYyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IEFwcGxpZWQsIHRoYW5rcy4KClRoYW5rcy4K
SG93ZXZlciwgSSBoYXZlbid0IHN0aWxsIG5vdGljZWQgYSB0cmFjZSBvZiBpdCBpbiBMaW51eCBu
ZXh0LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
