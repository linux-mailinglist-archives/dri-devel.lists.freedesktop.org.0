Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F5A3E471
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 20:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633A10E9D1;
	Thu, 20 Feb 2025 19:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374EE10E9D1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 19:00:50 +0000 (UTC)
Message-ID: <e8883543-e80e-4c9e-80af-475bc79c4712@lankhorst.se>
Date: Thu, 20 Feb 2025 20:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add entry for DMEM cgroup controller
To: Tejun Heo <tj@kernel.org>
Cc: dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>
References: <20250220140757.16823-1-dev@lankhorst.se>
 <Z7dNdKLxEDqxkNmJ@slm.duckdns.org>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <Z7dNdKLxEDqxkNmJ@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you all, pushed to drm-misc-fixes. :)

On 2025-02-20 16:42, Tejun Heo wrote:
> On Thu, Feb 20, 2025 at 03:07:57PM +0100, Maarten Lankhorst wrote:
>> The cgroups controller is currently maintained through the
>> drm-misc tree, so lets add add Maxime Ripard, Natalie Vock
>> and me as specific maintainers for dmem.
>>
>> We keep the cgroup mailing list CC'd on all cgroup specific patches.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Acked-by: Natalie Vock <natalie.vock@gmx.de>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> Thanks.
> 

