Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A319613812B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 12:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8F6E217;
	Sat, 11 Jan 2020 11:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401FF6E217;
 Sat, 11 Jan 2020 11:41:19 +0000 (UTC)
Received: from xdsl-77-86-196-137.nebulazone.fi ([77.86.196.137]
 helo=[192.168.1.190]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <tjaalton@ubuntu.com>)
 id 1iqF8k-0006Ja-P2; Sat, 11 Jan 2020 11:41:14 +0000
Subject: Re: Some eDP fixes/improvements.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
From: Timo Aaltonen <tjaalton@ubuntu.com>
Autocrypt: addr=tjaalton@ubuntu.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <606fd788-ef02-5869-f5ce-15559b6cec70@ubuntu.com>
Date: Sat, 11 Jan 2020 13:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
Content-Language: en-US
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
Cc: alexander.deucher@amd.com, mario.kleiner.de@gmail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9.1.2020 17.20, Mario Kleiner wrote:
> Hi and happy new year!
> 
> Since i now have a MBP 2017 to play with, with a 10 bit Retina panel,
> and Polaris gpu, i'm trying to get it to get 10 bits, and found one
> small bug [fix: patch1], and a quirk of Apples Retina eDP sink, for
> which i propose patch2 as solution. I sent a similar patch to i915 to
> make 10 bit Retina work with the Intel Kabylake igp on that machine.
> 
> If these make sense, it would be cool to still get them into drm-fixes
> for Linux 5.5, so users of spring distro updates like Ubuntu 20.04 LTS
> can get a more colorful new year.

Just FTR, 20.04 will ship with 5.4 longterm kernel, not 5.5.


-- 
t
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
