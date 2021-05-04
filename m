Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE503727EE
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 11:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79B86EAB1;
	Tue,  4 May 2021 09:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A626EAB1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 09:16:52 +0000 (UTC)
IronPort-SDR: 2XTGqNqDCjpu1Iyk3Nx+VP7sV0Gv0Yj9KYB0xoRPRnR3EfoxQ8tzpX3kZQiZJD3YZIRJop8GNN
 Zuf6mT0acDlg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197989959"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="197989959"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 02:16:50 -0700
IronPort-SDR: 2BuSsp3pRuW5nJBIXGUjD09PUfky5IU1Fg0Rv0iqjhARGQC9SpY4Re/gGzmWYAt6niGPIeogEU
 jfOeejIFGwjg==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="388729903"
Received: from mjjankow-mobl.ger.corp.intel.com (HELO [10.252.21.117])
 ([10.252.21.117])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 02:16:49 -0700
Subject: Re: [PATCH] drm/ttm: fix warning in new sys man
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210503142710.153369-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <e37c8ce6-afe8-215c-db80-6601179ad0c0@intel.com>
Date: Tue, 4 May 2021 10:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503142710.153369-1-christian.koenig@amd.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMDUvMjAyMSAxNToyNywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBJbmNsdWRlIHRo
ZSBoZWFkZXIgZm9yIHRoZSBwcm90b3R5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
