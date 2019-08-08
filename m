Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF985BEB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024986E7BE;
	Thu,  8 Aug 2019 07:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10F86E0A2;
 Thu,  8 Aug 2019 01:21:50 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvX7X-0000Oj-KW; Thu, 08 Aug 2019 01:21:35 +0000
Date: Thu, 8 Aug 2019 02:21:35 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCHv2 2/3] i915: convert to new mount API
Message-ID: <20190808012135.GJ1131@ZenIV.linux.org.uk>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
 <20190805160307.5418-3-sergey.senozhatsky@gmail.com>
 <20190805181255.GH1131@ZenIV.linux.org.uk>
 <20190805182834.GI1131@ZenIV.linux.org.uk>
 <alpine.LSU.2.11.1908060007190.1941@eggly.anvils>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.11.1908060007190.1941@eggly.anvils>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTI6NTA6MTBBTSAtMDcwMCwgSHVnaCBEaWNraW5zIHdy
b3RlOgoKPiB0aGF0IG1hcHBpbmcgbXVzdCBoYXZlIGJlZW4gZGVjaWRlZCBwcmV2aW91c2x5KS4g
IEluIEdvb2dsZSB3ZSBkbyB1c2UKPiBmY250bHMgRl9IVUdFUEFHRSBhbmQgRl9OT0hVR0VQQUdF
IHRvIG92ZXJyaWRlIG9uIGEgcGVyLWZpbGUgYmFzaXMgLQo+IG9uZSBkYXkgSSdsbCBnZXQgdG8g
dXBzdHJlYW1pbmcgdGhvc2UuCgpUaGF0J2QgYmUgbmljZSAtIHdlIGNvdWxkIGtpbGwgdGhlIGk5
MTUgd2llcmQgcHJpdmF0ZSBzaG1lbSBpbnN0YW5jZSwKYWxvbmcgd2l0aCBzb21lIGtsdWRnZXMg
aW4gbW0vc2htZW0uYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
