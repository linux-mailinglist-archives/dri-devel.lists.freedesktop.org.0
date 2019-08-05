Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C382C8B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2694C89B29;
	Tue,  6 Aug 2019 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05489CA1;
 Mon,  5 Aug 2019 18:35:36 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1huhTb-0007sZ-Cd; Mon, 05 Aug 2019 18:12:55 +0000
Date: Mon, 5 Aug 2019 19:12:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
Message-ID: <20190805181255.GH1131@ZenIV.linux.org.uk>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDE6MDM6MDZBTSArMDkwMCwgU2VyZ2V5IFNlbm96aGF0
c2t5IHdyb3RlOgo+IHRtcGZzIGRvZXMgbm90IHNldCAtPnJlbW91bnRfZnMoKSBhbnltb3JlIGFu
ZCBpdHMgdXNlcnMgbmVlZAo+IHRvIGJlIGNvbnZlcnRlZCB0byBuZXcgbW91bnQgQVBJLgoKQ291
bGQgeW91IGV4cGxhaW4gd2h5IHRoZSBkZXZpbCBkbyB5b3UgYm90aGVyIHdpdGggcmVtb3VudCBh
dCBhbGw/CldoeSBub3QgcGFzcyB0aGUgcmlnaHQgb3B0aW9ucyB3aGVuIG1vdW50aW5nIHRoZSBk
YW1uIHRoaW5nPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
