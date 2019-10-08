Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849DCF280
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 08:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E312B6E0B6;
	Tue,  8 Oct 2019 06:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FF46E0B6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 06:13:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 23:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="206578422"
Received: from wpross-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.86])
 by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2019 23:13:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mat King <mathewk@google.com>, Sean Paul <seanpaul@chromium.org>
Subject: Re: New sysfs interface for privacy screens
In-Reply-To: <CAL_quvTe_v9Vsbd0u4URitojmD-_VFeaOQ1BBYZ_UGwYWynjVA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com> <20191002102428.zaid63hp6wpd7w34@holly.lan>
 <8736gbbf2b.fsf@intel.com>
 <CAL_quvQkFjkBjJC5wH2t5XmyEq9OKWYSbAv39BJWT1hrKO7j8g@mail.gmail.com>
 <87h84q9pcj.fsf@intel.com>
 <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
 <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
 <CAL_quvTe_v9Vsbd0u4URitojmD-_VFeaOQ1BBYZ_UGwYWynjVA@mail.gmail.com>
Date: Tue, 08 Oct 2019 09:13:51 +0300
Message-ID: <87sgo3dasg.fsf@intel.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, Ross Zwisler <zwisler@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jingoo Han <jingoohan1@gmail.com>,
 David Airlie <airlied@redhat.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgTWF0IEtpbmcgPG1hdGhld2tAZ29vZ2xlLmNvbT4gd3JvdGU6
Cj4gVGhhdCBtYWtlcyBzZW5zZTsganVzdCB0byBjb25maXJtIGNhbiBhIHByb3BlcnR5IGJlIGFk
ZGVkIG9yIHJlbW92ZWQKPiBhZnRlciB0aGUgY29ubmVjdG9yIGlzIHJlZ2lzdGVyZWQ/CgpZb3Ug
bmVlZCB0byBjcmVhdGUgdGhlIHByb3BlcnR5IGJlZm9yZSByZWdpc3RlcmluZyB0aGUgZHJtIGRl
dmljZS4gWW91CmNhbiBhdHRhY2gvZGV0YWNoIHRoZSBwcm9wZXJ0eSBsYXRlciwgYnV0IEkgc2hv
dWxkIHRoaW5rIHlvdSBrbm93IGJ5IHRoZQp0aW1lIHlvdSdyZSByZWdpc3RlcmluZyB0aGUgY29u
bmVjdG9yIHdoZXRoZXIgaXQgc3VwcG9ydHMgdGhlIHByaXZhY3kKc2NyZWVuIG9yIG5vdC4KCkJS
LApKYW5pLgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
