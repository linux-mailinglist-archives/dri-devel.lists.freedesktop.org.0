Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAAD36B819
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853D89D8E;
	Mon, 26 Apr 2021 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434B589D8E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 17:31:12 +0000 (UTC)
Received: from [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15] (unknown
 [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 38DC41F422C4;
 Mon, 26 Apr 2021 18:30:57 +0100 (BST)
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
To: Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
 <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
 <20210426103656.0a212089@eldfell>
 <UucmifK8H9QRiWjD9XezmvdKmY-gXYG2c5LcJlAtmZDvpmvX3dqiNqzng6EPm6Kj_1_1nKi4S2vzFPTpKYoou_ARj-27xlxSoeMtrcpxLUk=@emersion.fr>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <550b87d0-d180-32cb-349e-1ff000c0530f@collabora.com>
Date: Mon, 26 Apr 2021 14:30:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <UucmifK8H9QRiWjD9XezmvdKmY-gXYG2c5LcJlAtmZDvpmvX3dqiNqzng6EPm6Kj_1_1nKi4S2vzFPTpKYoou_ARj-27xlxSoeMtrcpxLUk=@emersion.fr>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/21 7:58 AM, Simon Ser wrote:
> On Monday, April 26th, 2021 at 9:36 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
>>>> This should probably explain what the bits in the mask correspond to.
>>>> As in, which CRTC does bit 0 refer to, and so on.
>>>
>>> What about:
>>>
>>> "possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's are
>>> created and they receive an index, which corresponds to their position
>>> in the bitmask. CRTC with index 0 will be in bit 0, and so on."
>>
>> This would still need to explain where can I find this index.
> 

What do you mean?

> This closed merge request had some docs about possible CRTCs:
> 
> https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/102
> 
I'm afraid I don't know exactly what you expect to be documented here
that is still missing. Could you please elaborate?

Thanks a lot!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
