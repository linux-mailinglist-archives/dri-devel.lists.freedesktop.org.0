Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11215E1978
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 13:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9A56EA54;
	Wed, 23 Oct 2019 11:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E016EA53;
 Wed, 23 Oct 2019 11:56:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 04:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="201968405"
Received: from jsakkine-mobl1.tm.intel.com (HELO localhost) ([10.237.50.121])
 by orsmga006.jf.intel.com with ESMTP; 23 Oct 2019 04:56:37 -0700
Date: Wed, 23 Oct 2019 14:56:37 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH] Cleanup: replace prefered with preferred
Message-ID: <20191023115637.GA23733@linux.intel.com>
References: <20191022214208.211448-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022214208.211448-1-salyzyn@android.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Alexander Aring <alex.aring@gmail.com>, linux-efi@vger.kernel.org,
 Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Feng Tang <feng.tang@intel.com>,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Rafael Aquini <aquini@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Jonathan Corbet <corbet@lwn.net>,
 Francesco Ruggeri <fruggeri@arista.com>,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, kernel-team@android.com,
 linux-media@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Hans de Goede <hdegoede@redhat.com>, hersen wu <hersenxs.wu@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Maxim Martynov <maxim@arista.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-bluetooth@vger.kernel.org,
 David Ahern <dsahern@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-wpan@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDI6NDE6NDVQTSAtMDcwMCwgTWFyayBTYWx5enluIHdy
b3RlOgo+IFJlcGxhY2UgYWxsIG9jY3VycmVuY2VzIG9mIHByZWZlcmVkIHdpdGggcHJlZmVycmVk
IHRvIG1ha2UgZnV0dXJlCj4gY2hlY2twYXRjaC5wbCdzIGhhcHB5LiAgQSBmZXcgcGxhY2VzIHRo
ZSBpbmNvcnJlY3Qgc3BlbGxpbmcgaXMKPiBtYXRjaGVkIHdpdGggdGhlIGNvcnJlY3Qgc3BlbGxp
bmcgdG8gcHJlc2VydmUgZXhpc3RpbmcgdXNlciBzcGFjZSBBUEkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWFyayBTYWx5enluIDxzYWx5enluQGFuZHJvaWQuY29tPgoKSSdkIGZpeCBzdWNoIHRoaW5n
cyB3aGVuIHRoZSBjb2RlIGlzIG90aGVyd2lzZSBjaGFuZ2UgYW5kIHNjb3BlIHRoaXMKcGF0Y2gg
b25seSB0byBEb2N1bWVudGF0aW9uLy4gVGhlcmUgaXMgbm8gcHJhZ21hdGljIGJlbmVmaXQgb2Yg
ZG9pbmcKdGhpcyBmb3IgdGhlIGNvZGUuCgovSmFya2tvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
