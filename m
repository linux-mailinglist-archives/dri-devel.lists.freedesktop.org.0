Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B02103C94
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4311E6E9F6;
	Wed, 20 Nov 2019 13:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DC26E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:50:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 193so14235340pfc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 05:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OyieLJ1Q4b4TjminHrLGIRlIaNN2ozqzVE5QUxBBtOE=;
 b=Ugf0ij96PWe45PGUyzIWigAPbkhGOpUXoAu8V7G6WUX+wt5yl253cAkP7FPhUhDMvK
 diEtTY5yLsgiOysMfZUGa9eQYsW/CqoSRIzoMMHgTWddQ1x+w5o/vu3FMAl1tPVfq1vE
 utp6Mjln51M3P6aMpOJ2tkJ2DmJmViaaujhUWXIGVCJIfae+8mPYaebBxNZiWI5JbCML
 qjtnCl7699+Ro9NMuuXoq6dT817djfBrsjTglHUCzmRFiaKhr+U4yERrQ+E6NLUURjcm
 0vlc4WfGNFjPT6fQrtcZRN/QfKL/nYC+V41CG9OnrPlgeaVDJl2ilp4t7l9xwMU3q+Jr
 u2Pg==
X-Gm-Message-State: APjAAAUt81TID4vlyt9XswFKaIZ7wUuOhayUoP6T6IEE+CNHFcpSR6dd
 eECy8NBDEhqw95Tp+juUyPs=
X-Google-Smtp-Source: APXvYqznbb6ml/3cJWeJZ7kaQBiiMHytQFDrl8Oth2mMRG8vaWWS54IdG4w6Y8FENZKLCLRDmQ6vbg==
X-Received: by 2002:a63:1360:: with SMTP id 32mr3294515pgt.3.1574257817641;
 Wed, 20 Nov 2019 05:50:17 -0800 (PST)
Received: from kozik-lap ([118.189.143.39])
 by smtp.googlemail.com with ESMTPSA id j7sm26942590pgl.38.2019.11.20.05.50.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Nov 2019 05:50:16 -0800 (PST)
Date: Wed, 20 Nov 2019 21:50:12 +0800
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] video: Fix Kconfig indentation
Message-ID: <20191120135012.GA17348@kozik-lap>
References: <20191120133838.13132-1-krzk@kernel.org>
 <20191120134546.GA2654@pine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120134546.GA2654@pine>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDg6NDU6NDZBTSAtMDUwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA5OjM4OjM4UE0gKzA4MDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMg
dG8gdGFiICgrb3B0aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiA+IGNvZGluZyBzdHlsZSB3aXRo
IGNvbW1hbmQgbGlrZToKPiA+IAkkIHNlZCAtZSAncy9eICAgICAgICAvXHQvJyAtaSAqL0tjb25m
aWcKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgo+IAo+IE5vIHBhcnRpY3VsYXIgb2JqZWN0aW9ucyBidXQgSSB3b25kZXIgaWYgdGhp
cyB3b3VsZCBiZSBiZXR0ZXIgc2VudCB0bwo+IHRyaXZpYWxAa2VybmVsLm9yZyAuCgpUaGFua3Mg
Zm9yIGZlZWRiYWNrLgoKSSBzZW50IHRvIHRyaXZpYWwgYW5kIGtlcm5lbC1qYW5pdG9ycyBteSBw
cmV2aW91cyB2ZXJzaW9uIG9mIHRoaXMKcGF0Y2hzZXQgd2hpY2ggd2FzIG5vdCBzcGxpdCBwZXIt
c3Vic3lzdGVtIGFuZCB0aGVyZSB3YXMgbm8gZmVlZGJhY2suCkZldyBvdGhlciBwYXRjaGVzIGFs
cmVhZHkgY2FtZSB0aHJvdWdoIG1haW50YWluZXJzLiBJZiB0aGVyZSB3aWxsIGJlIG5vCnJlcGx5
LCBJJ2xsIHNlbmQgbmV4dCB2ZXJzaW9uIHRocm91Z2ggdHJpdmlhbC4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
