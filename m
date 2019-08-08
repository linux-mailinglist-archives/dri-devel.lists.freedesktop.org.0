Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5C86C39
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 23:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870A36E8C5;
	Thu,  8 Aug 2019 21:21:42 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8395B6E188
 for <dri-devel@freedesktop.org>; Thu,  8 Aug 2019 21:21:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 14:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,363,1559545200"; 
 d="scan'208,217";a="176643648"
Received: from desilva-mobl.ger.corp.intel.com (HELO [10.252.35.189])
 ([10.252.35.189])
 by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2019 14:21:37 -0700
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mltQQVRDSCB2MyAxLzFdIGRybS9zeW5jb2JqOiBh?=
 =?UTF-8?Q?dd_sideband_payload?=
To: Jason Ekstrand <jason@jlekstrand.net>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190808131402.14519-1-lionel.g.landwerlin@intel.com>
 <20190808131402.14519-2-lionel.g.landwerlin@intel.com>
 <1df1b652-ee72-e5f8-7ed0-acbfa9f89f58@amd.com>
 <c44f567b-1745-8dd2-927b-e7d1d5f7d568@intel.com>
 <a2d7f184-294f-c339-9e2d-684dde24b265@amd.com>
 <3c50cb73-a795-a13e-219b-8ed549ae55b2@intel.com>
 <5072aa73-c4b8-e4bf-67ba-ce6d603c24f9@amd.com>
 <fcb1f4f2-2c96-b9f8-a95c-7b0178e0a66b@intel.com>
 <1e225329-3d10-1a80-cca8-fe6f4b57fdfb@amd.com>
 <001b9250-e62c-4eb3-38c4-1ebffc3ac6ca@intel.com>
 <jpj2hq-gc4rtpn2vzyj-4d9mg2-idv0dc-g9aoyh-tnn7jq-3ji9nb-u7bc16lcz1gx-m949odea8admiqio0k-dawo4sbud2lr-yyfxz9-we1fbj-nve980-vo8wox-dpxeok-1g0ghu-27hadecortp7-dx288y.1565277745885@email.android.com>
 <59a0dd5c-0048-4c70-3c8f-dc2e83b3261e@amd.com>
 <CAOFGe95duM+626zzf0S=WcZ+wMFa=pyw=ohhecRi6a8_Rz_owg@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <c4fadc95-78b4-f7c6-65cc-9563e08be663@intel.com>
Date: Fri, 9 Aug 2019 00:21:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe95duM+626zzf0S=WcZ+wMFa=pyw=ohhecRi6a8_Rz_owg@mail.gmail.com>
Content-Language: en-US
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
Cc: "dri-devel@freedesktop.org" <dri-devel@freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0703115211=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0703115211==
Content-Type: multipart/alternative;
 boundary="------------968383C906EF7863FC53AB05"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------968383C906EF7863FC53AB05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/08/2019 19:23, Jason Ekstrand wrote:
> I've got a couple questions that I think go along the lines of what 
> Christian wrote:
>
> 1. Should it really be called sideband?  It's a very generic term for 
> what is currently a very generic thing. However, maybe we don't want 
> it to be so generic?
>
> 2. Do we really want get/set?  Or do we want get/increment?  We have 
> to do the get/increment during vkQueueSubmit on both the wait and the 
> signal side but get+add+set is a bit heavy.  I guess you could do one 
> bit get of all the binary semaphores and then a set for all the 
> signaled ones which sets them to the previous value + 1.


Our last iteration gather all the binary semaphores to read them and 
write them all back with signaled one incremented by one.

It could be batched into one ioctl with a flag that checks whether a 
given syncobj needs to be get+inc or just get.


>
> My concern with making it a super-generic thing is that it has an 
> extremely specific use and in order for cross-process sharing to work, 
> all users have to use it exactly the same way.  We could call it a 
> "reserved value" or something like that to make it more clear what the 
> intention is.  In any case, we should make sure that it's very clearly 
> documented in the design doc.


Agreed, this needs documentation.

I'll add a preceding commit adding timeline documentation and document this.


-Lionel


>
> On Thu, Aug 8, 2019 at 10:26 AM Koenig, Christian 
> <Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>> wrote:
>
>     Yeah, the idea is indeed rather clever. I'm just wondering if we
>     don't need to optimize it even more.
>
>     In other words could some IOCTL overhead be saved here if we
>     directly take the value for binary semaphores waits and signals?
>
>     Christian.
>
>     Am 08.08.19 um 17:23 schrieb Zhou, David(ChunMing):
>>     Thank you, I got your mean.
>>     when you have sideband payload, you will go into timeline path.
>>     Clever!
>>
>>     -David
>>
>>     -------- 原始邮件 --------
>>     主题：Re: [PATCH v3 1/1] drm/syncobj: add sideband payload
>>     发件人：Lionel Landwerlin
>>     收件人："Zhou, David(ChunMing)" ,dri-devel@freedesktop.org
>>     <mailto:dri-devel@freedesktop.org>
>>     抄送："Koenig, Christian" ,Jason Ekstrand ,"Zhou, David(ChunMing)"
>>
>>     On 08/08/2019 17:48, Chunming Zhou wrote:
>>     > 在 2019/8/8 22:34, Lionel Landwerlin 写道:
>>     >> On 08/08/2019 17:16, Chunming Zhou wrote:
>>     >>> 在 2019/8/8 22:01, Lionel Landwerlin 写道:
>>     >>>> On 08/08/2019 16:42, Chunming Zhou wrote:
>>     >>>>> No, I just see your comment "The next vkQueueSubmit()
>>     >>>>> waiting on a the syncobj will read the sideband payload and
>>     wait for a
>>     >>>>> fence chain element with a seqno superior or equal to the
>>     sideband
>>     >>>>> payload value to be added into the fence chain and use that
>>     fence to
>>     >>>>> trigger the submission on the kernel driver. ".
>>     >>>> That was meant to say wait on the chain fence to reach the
>>     sideband
>>     >>>> payload value.
>>     >>>>
>>     >>>> It a bit confusing but I can't see any other way to word it.
>>     >>>>
>>     >>>>
>>     >>>>> In that, you mentioned wait for sideband.
>>     >>>>> So I want to know we how to use that, maybe I miss something in
>>     >>>>> previous
>>     >>>>> discussing thread.
>>     >>>> In QueueSubmit(), we start by reading the sideband payloads :
>>     >>>>
>>     https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L655
>>     >>>>
>>     >>>>
>>     >>>> Then build everything for the submission and hand it over to the
>>     >>>> submission thread.
>>     >>>>
>>     >>>> Instead of the just waiting on the timeline semaphore
>>     values, we also
>>     >>>> wait on the binary semaphore sideband payload values.
>>     >>> Waiting on timeline values is when finding fence in kernel.
>>     >>
>>     >> Hmm aren't you waiting in a thread in userspace?
>>     > Yes, For timeline case, we can use waitForSyncobj()..., At begin of
>>     > QueueThread, I let it wait in cs_ioctl when drm_syncobj_find_fence.
>>     >
>>     > But I still didn't get how to wait on sideband for binary Syncobj.
>>     >
>>     > Ah, I see, you will compare it in your QueueThread, if sideband
>>     value is
>>     >   >= expected, then do submission, otherwise, loop QueueThread,
>>     right?
>>
>>
>>     Just treat binary semaphores as timelines and waitForSyncobj on the
>>     sideband payload value.
>>
>>     It should make the submission thread any busier than currently.
>>
>>
>>     -Lionel
>>
>>
>>     >
>>     > That sounds the QueueThread will be always busy.
>>     >
>>     > -David
>>     >
>>     >
>>     >>
>>     >>> But I don't see how to wait/block in kernel when finding
>>     fence for
>>     >>> binary sideband payload  values.
>>     >>
>>     >> Essentially our driver now handles timelines & binary
>>     semaphore using
>>     >> dma-fence-chain in both cases.
>>     >
>>     >
>>     >> Only with timelines we take the values submitted by the vulkan
>>     >> application.
>>     >
>>     >> The binary semaphore auto increment on vkQueueSubmit() and that is
>>     >> managed by the userspace driver.
>>     >>
>>     >>
>>     >> -Lionel
>>     >>
>>     >>
>>     >>>
>>     >>> -David
>>     >>>
>>     >>>> Finally before exiting the QueueSubmit() call, we bump the
>>     sideband
>>     >>>> payloads of all the binary semaphores have have been signaled :
>>     >>>>
>>     https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L806
>>     >>>>
>>     >>>>
>>     >>>>
>>     >>>> Whoever calls QueueSubmit() after that will pickup the new
>>     sideband
>>     >>>> payload values to wait on.
>>     >>>>
>>     >>>>
>>     >>>> -Lionel
>>     >>>>
>>     >>>>
>>     >>>>
>>     >>>>> -DAvid
>>     >>>>>
>>     >>>>>
>>     >>>>> 在 2019/8/8 21:38, Lionel Landwerlin 写道:
>>     >>>>>> Interesting question :)
>>     >>>>>>
>>     >>>>>> I didn't see any usecase for that.
>>     >>>>>> This sideband payload value is used for a wait so waiting
>>     on the wait
>>     >>>>>> value for another wait is bit meta :)
>>     >>>>>>
>>     >>>>>> Do you have a use case for that?
>>     >>>>>>
>>     >>>>>> -Lionel
>>     >>>>>>
>>     >>>>>> On 08/08/2019 16:23, Chunming Zhou wrote:
>>     >>>>>>> The propursal is fine with me.
>>     >>>>>>>
>>     >>>>>>> one question:
>>     >>>>>>>
>>     >>>>>>> how to wait sideband payload? Following patch will show that?
>>     >>>>>>>
>>     >>>>>>> -David
>>     >>>>>>>
>>     >>>>>>> 在 2019/8/8 21:14, Lionel Landwerlin 写道:
>>     >>>>>>>> The Vulkan timeline semaphores allow signaling to happen
>>     on the
>>     >>>>>>>> point
>>     >>>>>>>> of the timeline without all of the its dependencies to
>>     be created.
>>     >>>>>>>>
>>     >>>>>>>> The current 2 implementations (AMD/Intel) of the Vulkan
>>     spec on
>>     >>>>>>>> top of
>>     >>>>>>>> the Linux kernel are using a thread to wait on the
>>     dependencies
>>     >>>>>>>> of a
>>     >>>>>>>> given point to materialize and delay actual submission
>>     to the
>>     >>>>>>>> kernel
>>     >>>>>>>> driver until the wait completes.
>>     >>>>>>>>
>>     >>>>>>>> If a binary semaphore is submitted for signaling along
>>     the side
>>     >>>>>>>> of a
>>     >>>>>>>> timeline semaphore waiting for completion that means
>>     that the drm
>>     >>>>>>>> syncobj associated with that binary semaphore will not
>>     have a DMA
>>     >>>>>>>> fence associated with it by the time vkQueueSubmit()
>>     returns. This
>>     >>>>>>>> and
>>     >>>>>>>> the fact that a binary semaphore can be signaled and
>>     unsignaled as
>>     >>>>>>>> before its DMA fences materialize mean that we cannot
>>     just rely on
>>     >>>>>>>> the
>>     >>>>>>>> fence within the syncobj but we also need a sideband payload
>>     >>>>>>>> verifying
>>     >>>>>>>> that the fence in the syncobj matches the last
>>     submission from the
>>     >>>>>>>> Vulkan API point of view.
>>     >>>>>>>>
>>     >>>>>>>> This change adds a sideband payload that is incremented with
>>     >>>>>>>> signaled
>>     >>>>>>>> syncobj when vkQueueSubmit() is called. The next
>>     vkQueueSubmit()
>>     >>>>>>>> waiting on a the syncobj will read the sideband payload
>>     and wait
>>     >>>>>>>> for a
>>     >>>>>>>> fence chain element with a seqno superior or equal to
>>     the sideband
>>     >>>>>>>> payload value to be added into the fence chain and use that
>>     >>>>>>>> fence to
>>     >>>>>>>> trigger the submission on the kernel driver.
>>     >>>>>>>>
>>     >>>>>>>> v2: Use a separate ioctl to get/set the sideband value
>>     (Christian)
>>     >>>>>>>>
>>     >>>>>>>> v3: Use 2 ioctls for get/set (Christian)
>>     >>>>>>>>
>>     >>>>>>>> Signed-off-by: Lionel Landwerlin
>>     <lionel.g.landwerlin@intel.com>
>>     <mailto:lionel.g.landwerlin@intel.com>
>>     >>>>>>>> Cc: Christian Koenig <Christian.Koenig@amd.com>
>>     <mailto:Christian.Koenig@amd.com>
>>     >>>>>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>     <mailto:jason@jlekstrand.net>
>>     >>>>>>>> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
>>     <mailto:David1.Zhou@amd.com>
>>     >>>>>>>> ---
>>     >>>>>>>> drivers/gpu/drm/drm_internal.h |  4 ++
>>     >>>>>>>> drivers/gpu/drm/drm_ioctl.c    |  5 +++
>>     >>>>>>>> drivers/gpu/drm/drm_syncobj.c  | 79
>>     >>>>>>>> +++++++++++++++++++++++++++++++++-
>>     >>>>>>>> include/drm/drm_syncobj.h      |  9 ++++
>>     >>>>>>>> include/uapi/drm/drm.h         |  2 +
>>     >>>>>>>>       5 files changed, 98 insertions(+), 1 deletion(-)
>>     >>>>>>>>
>>     >>>>>>>> diff --git a/drivers/gpu/drm/drm_internal.h
>>     >>>>>>>> b/drivers/gpu/drm/drm_internal.h
>>     >>>>>>>> index 51a2055c8f18..0c9736199df0 100644
>>     >>>>>>>> --- a/drivers/gpu/drm/drm_internal.h
>>     >>>>>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>     >>>>>>>> @@ -208,6 +208,10 @@ int
>>     drm_syncobj_timeline_signal_ioctl(struct
>>     >>>>>>>> drm_device *dev, void *data,
>>     >>>>>>>>                            struct drm_file *file_private);
>>     >>>>>>>>       int drm_syncobj_query_ioctl(struct drm_device
>>     *dev, void
>>     >>>>>>>> *data,
>>     >>>>>>>>                      struct drm_file *file_private);
>>     >>>>>>>> +int drm_syncobj_get_sideband_ioctl(struct drm_device
>>     *dev, void
>>     >>>>>>>> *data,
>>     >>>>>>>> +                   struct drm_file *file_private);
>>     >>>>>>>> +int drm_syncobj_set_sideband_ioctl(struct drm_device
>>     *dev, void
>>     >>>>>>>> *data,
>>     >>>>>>>> +                   struct drm_file *file_private);
>>     >>>>>>>>          /* drm_framebuffer.c */
>>     >>>>>>>>       void drm_framebuffer_print_info(struct drm_printer *p,
>>     >>>>>>>> unsigned
>>     >>>>>>>> int indent,
>>     >>>>>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c
>>     >>>>>>>> b/drivers/gpu/drm/drm_ioctl.c
>>     >>>>>>>> index f675a3bb2c88..48500bf62801 100644
>>     >>>>>>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>     >>>>>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>     >>>>>>>> @@ -703,6 +703,11 @@ static const struct drm_ioctl_desc
>>     >>>>>>>> drm_ioctls[]
>>     >>>>>>>> = {
>>     >>>>>>>>                    DRM_RENDER_ALLOW),
>>     >>>>>>>> DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY,
>>     >>>>>>>> drm_syncobj_query_ioctl,
>>     >>>>>>>>                    DRM_RENDER_ALLOW),
>>     >>>>>>>> + DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_GET_SIDEBAND,
>>     >>>>>>>> drm_syncobj_get_sideband_ioctl,
>>     >>>>>>>> + DRM_RENDER_ALLOW),
>>     >>>>>>>> + DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_SET_SIDEBAND,
>>     >>>>>>>> drm_syncobj_set_sideband_ioctl,
>>     >>>>>>>> + DRM_RENDER_ALLOW),
>>     >>>>>>>> +
>>     >>>>>>>> DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE,
>>     >>>>>>>> drm_crtc_get_sequence_ioctl, 0),
>>     >>>>>>>> DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE,
>>     >>>>>>>> drm_crtc_queue_sequence_ioctl, 0),
>>     >>>>>>>> DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE,
>>     >>>>>>>> drm_mode_create_lease_ioctl, DRM_MASTER),
>>     >>>>>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c
>>     >>>>>>>> b/drivers/gpu/drm/drm_syncobj.c
>>     >>>>>>>> index b927e482e554..c90ef20b9242 100644
>>     >>>>>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>     >>>>>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>     >>>>>>>> @@ -1150,8 +1150,10 @@ drm_syncobj_reset_ioctl(struct
>>     drm_device
>>     >>>>>>>> *dev, void *data,
>>     >>>>>>>>           if (ret < 0)
>>     >>>>>>>> return ret;
>>     >>>>>>>>       -    for (i = 0; i < args->count_handles; i++)
>>     >>>>>>>> +    for (i = 0; i < args->count_handles; i++) {
>>     >>>>>>>> drm_syncobj_replace_fence(syncobjs[i], NULL);
>>     >>>>>>>> + syncobjs[i]->sideband_payload = 0;
>>     >>>>>>>> +    }
>>     >>>>>>>> drm_syncobj_array_free(syncobjs, args->count_handles);
>>     >>>>>>>>       @@ -1321,6 +1323,81 @@ int
>>     drm_syncobj_query_ioctl(struct
>>     >>>>>>>> drm_device *dev, void *data,
>>     >>>>>>>>               if (ret)
>>     >>>>>>>> break;
>>     >>>>>>>>           }
>>     >>>>>>>> +
>>     >>>>>>>> + drm_syncobj_array_free(syncobjs, args->count_handles);
>>     >>>>>>>> +
>>     >>>>>>>> +    return ret;
>>     >>>>>>>> +}
>>     >>>>>>>> +
>>     >>>>>>>> +int drm_syncobj_get_sideband_ioctl(struct drm_device
>>     *dev, void
>>     >>>>>>>> *data,
>>     >>>>>>>> +                   struct drm_file *file_private)
>>     >>>>>>>> +{
>>     >>>>>>>> +    struct drm_syncobj_timeline_array *args = data;
>>     >>>>>>>> +    struct drm_syncobj **syncobjs;
>>     >>>>>>>> +    uint64_t __user *points =
>>     u64_to_user_ptr(args->points);
>>     >>>>>>>> +    uint32_t i;
>>     >>>>>>>> +    int ret;
>>     >>>>>>>> +
>>     >>>>>>>> +    if (!drm_core_check_feature(dev,
>>     DRIVER_SYNCOBJ_TIMELINE))
>>     >>>>>>>> +        return -EOPNOTSUPP;
>>     >>>>>>>> +
>>     >>>>>>>> +    if (args->pad != 0)
>>     >>>>>>>> +        return -EINVAL;
>>     >>>>>>>> +
>>     >>>>>>>> +    if (args->count_handles == 0)
>>     >>>>>>>> +        return -EINVAL;
>>     >>>>>>>> +
>>     >>>>>>>> +    ret = drm_syncobj_array_find(file_private,
>>     >>>>>>>> + u64_to_user_ptr(args->handles),
>>     >>>>>>>> +                     args->count_handles,
>>     >>>>>>>> +                     &syncobjs);
>>     >>>>>>>> +    if (ret < 0)
>>     >>>>>>>> +        return ret;
>>     >>>>>>>> +
>>     >>>>>>>> +    for (i = 0; i < args->count_handles; i++) {
>>     >>>>>>>> + copy_to_user(&points[i], &syncobjs[i]->sideband_payload,
>>     >>>>>>>> sizeof(uint64_t));
>>     >>>>>>>> +        ret = ret ? -EFAULT : 0;
>>     >>>>>>>> +        if (ret)
>>     >>>>>>>> + break;
>>     >>>>>>>> +    }
>>     >>>>>>>> +
>>     >>>>>>>> + drm_syncobj_array_free(syncobjs, args->count_handles);
>>     >>>>>>>> +
>>     >>>>>>>> +    return ret;
>>     >>>>>>>> +}
>>     >>>>>>>> +
>>     >>>>>>>> +int drm_syncobj_set_sideband_ioctl(struct drm_device
>>     *dev, void
>>     >>>>>>>> *data,
>>     >>>>>>>> +                   struct drm_file *file_private)
>>     >>>>>>>> +{
>>     >>>>>>>> +    struct drm_syncobj_timeline_array *args = data;
>>     >>>>>>>> +    struct drm_syncobj **syncobjs;
>>     >>>>>>>> +    uint64_t __user *points =
>>     u64_to_user_ptr(args->points);
>>     >>>>>>>> +    uint32_t i;
>>     >>>>>>>> +    int ret;
>>     >>>>>>>> +
>>     >>>>>>>> +    if (!drm_core_check_feature(dev,
>>     DRIVER_SYNCOBJ_TIMELINE))
>>     >>>>>>>> +        return -EOPNOTSUPP;
>>     >>>>>>>> +
>>     >>>>>>>> +    if (args->pad != 0)
>>     >>>>>>>> +        return -EINVAL;
>>     >>>>>>>> +
>>     >>>>>>>> +    if (args->count_handles == 0)
>>     >>>>>>>> +        return -EINVAL;
>>     >>>>>>>> +
>>     >>>>>>>> +    ret = drm_syncobj_array_find(file_private,
>>     >>>>>>>> + u64_to_user_ptr(args->handles),
>>     >>>>>>>> +                     args->count_handles,
>>     >>>>>>>> +                     &syncobjs);
>>     >>>>>>>> +    if (ret < 0)
>>     >>>>>>>> +        return ret;
>>     >>>>>>>> +
>>     >>>>>>>> +    for (i = 0; i < args->count_handles; i++) {
>>     >>>>>>>> + copy_from_user(&syncobjs[i]->sideband_payload, &points[i],
>>     >>>>>>>> sizeof(uint64_t));
>>     >>>>>>>> +        ret = ret ? -EFAULT : 0;
>>     >>>>>>>> +        if (ret)
>>     >>>>>>>> + break;
>>     >>>>>>>> +    }
>>     >>>>>>>> +
>>     >>>>>>>> drm_syncobj_array_free(syncobjs, args->count_handles);
>>     >>>>>>>> return ret;
>>     >>>>>>>> diff --git a/include/drm/drm_syncobj.h
>>     b/include/drm/drm_syncobj.h
>>     >>>>>>>> index 6cf7243a1dc5..b587b8e07547 100644
>>     >>>>>>>> --- a/include/drm/drm_syncobj.h
>>     >>>>>>>> +++ b/include/drm/drm_syncobj.h
>>     >>>>>>>> @@ -61,6 +61,15 @@ struct drm_syncobj {
>>     >>>>>>>>            * @file: A file backing for this syncobj.
>>     >>>>>>>>            */
>>     >>>>>>>>           struct file *file;
>>     >>>>>>>> +    /**
>>     >>>>>>>> +     * @sideband_payload: A 64bit side band payload.
>>     >>>>>>>> +     *
>>     >>>>>>>> +     * We use the sideband payload value to wait on
>>     binary syncobj
>>     >>>>>>>> fences
>>     >>>>>>>> +     * to materialize. It is a reservation mechanism
>>     for the
>>     >>>>>>>> signaler to
>>     >>>>>>>> +     * express that at some point in the future a dma
>>     fence with
>>     >>>>>>>> the same
>>     >>>>>>>> +     * seqno will be put into the syncobj.
>>     >>>>>>>> +     */
>>     >>>>>>>> +    u64 sideband_payload;
>>     >>>>>>>>       };
>>     >>>>>>>>          void drm_syncobj_free(struct kref *kref);
>>     >>>>>>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>     >>>>>>>> index 8a5b2f8f8eb9..cffdc6c9772c 100644
>>     >>>>>>>> --- a/include/uapi/drm/drm.h
>>     >>>>>>>> +++ b/include/uapi/drm/drm.h
>>     >>>>>>>> @@ -946,6 +946,8 @@ extern "C" {
>>     >>>>>>>>       #define DRM_IOCTL_SYNCOBJ_QUERY DRM_IOWR(0xCB, struct
>>     >>>>>>>> drm_syncobj_timeline_array)
>>     >>>>>>>>       #define DRM_IOCTL_SYNCOBJ_TRANSFER DRM_IOWR(0xCC,
>>     struct
>>     >>>>>>>> drm_syncobj_transfer)
>>     >>>>>>>>       #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL
>>     DRM_IOWR(0xCD,
>>     >>>>>>>> struct drm_syncobj_timeline_array)
>>     >>>>>>>> +#define DRM_IOCTL_SYNCOBJ_GET_SIDEBAND DRM_IOR(0xCE, struct
>>     >>>>>>>> drm_syncobj_timeline_array)
>>     >>>>>>>> +#define DRM_IOCTL_SYNCOBJ_SET_SIDEBAND DRM_IOWR(0xCF,
>>     struct
>>     >>>>>>>> drm_syncobj_timeline_array)
>>     >>>>>>>>          /**
>>     >>>>>>>>        * Device specific ioctls should only be in their
>>     respective
>>     >>>>>>>> headers
>>     >>
>>
>


--------------968383C906EF7863FC53AB05
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 08/08/2019 19:23, Jason Ekstrand
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOFGe95duM+626zzf0S=WcZ+wMFa=pyw=ohhecRi6a8_Rz_owg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>I've got a couple questions that I think go along the lines
          of what Christian wrote:</div>
        <div><br>
        </div>
        <div>1. Should it really be called sideband?  It's a very
          generic term for what is currently a very generic thing. 
          However, maybe we don't want it to be so generic?</div>
        <div><br>
        </div>
        <div>2. Do we really want get/set?  Or do we want
          get/increment?  We have to do the get/increment during
          vkQueueSubmit on both the wait and the signal side but
          get+add+set is a bit heavy.  I guess you could do one bit get
          of all the binary semaphores and then a set for all the
          signaled ones which sets them to the previous value + 1.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Our last iteration gather all the binary semaphores to read them
      and write them all back with signaled one incremented by one.</p>
    <p>It could be batched into one ioctl with a flag that checks
      whether a given syncobj needs to be get+inc or just get.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAOFGe95duM+626zzf0S=WcZ+wMFa=pyw=ohhecRi6a8_Rz_owg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>My concern with making it a super-generic thing is that it
          has an extremely specific use and in order for cross-process
          sharing to work, all users have to use it exactly the same
          way.  We could call it a "reserved value" or something like
          that to make it more clear what the intention is.  In any
          case, we should make sure that it's very clearly documented in
          the design doc.<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed, this needs documentation.</p>
    <p>I'll add a preceding commit adding timeline documentation and
      document this.</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAOFGe95duM+626zzf0S=WcZ+wMFa=pyw=ohhecRi6a8_Rz_owg@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Aug 8, 2019 at 10:26
            AM Koenig, Christian &lt;<a
              href="mailto:Christian.Koenig@amd.com"
              moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <div class="gmail-m_7409227408945320520moz-cite-prefix">Yeah,
                the idea is indeed rather clever. I'm just wondering if
                we don't need to optimize it even more.<br>
                <br>
                In other words could some IOCTL overhead be saved here
                if we directly take the value for binary semaphores
                waits and signals?<br>
                <br>
                Christian.<br>
                <br>
                Am 08.08.19 um 17:23 schrieb Zhou, David(ChunMing):<br>
              </div>
              <blockquote type="cite">
                <div>Thank you, I got your mean.<br>
                  when you have sideband payload, you will go into
                  timeline path. Clever!<br>
                  <br>
                  -David<br>
                  <br>
                  -------- 原始邮件 --------<br>
                  主题：Re: [PATCH v3 1/1] drm/syncobj: add sideband
                  payload<br>
                  发件人：Lionel Landwerlin <br>
                  收件人："Zhou, David(ChunMing)" ,<a
                    class="gmail-m_7409227408945320520moz-txt-link-abbreviated"
                    href="mailto:dri-devel@freedesktop.org"
                    target="_blank" moz-do-not-send="true">dri-devel@freedesktop.org</a><br>
                  抄送："Koenig, Christian" ,Jason Ekstrand ,"Zhou,
                  David(ChunMing)" <br>
                  <br>
                </div>
                <font size="2"><span style="font-size:11pt">
                    <div class="gmail-m_7409227408945320520PlainText">On
                      08/08/2019 17:48, Chunming Zhou wrote:<br>
                      &gt; 在 2019/8/8 22:34, Lionel Landwerlin 写道:<br>
                      &gt;&gt; On 08/08/2019 17:16, Chunming Zhou wrote:<br>
                      &gt;&gt;&gt; 在 2019/8/8 22:01, Lionel Landwerlin
                      写道:<br>
                      &gt;&gt;&gt;&gt; On 08/08/2019 16:42, Chunming
                      Zhou wrote:<br>
                      &gt;&gt;&gt;&gt;&gt; No, I just see your comment
                      "The next vkQueueSubmit()<br>
                      &gt;&gt;&gt;&gt;&gt; waiting on a the syncobj will
                      read the sideband payload and wait for a<br>
                      &gt;&gt;&gt;&gt;&gt; fence chain element with a
                      seqno superior or equal to the sideband<br>
                      &gt;&gt;&gt;&gt;&gt; payload value to be added
                      into the fence chain and use that fence to<br>
                      &gt;&gt;&gt;&gt;&gt; trigger the submission on the
                      kernel driver. ".<br>
                      &gt;&gt;&gt;&gt; That was meant to say wait on the
                      chain fence to reach the sideband<br>
                      &gt;&gt;&gt;&gt; payload value.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; It a bit confusing but I can't
                      see any other way to word it.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt; In that, you mentioned wait
                      for sideband.<br>
                      &gt;&gt;&gt;&gt;&gt; So I want to know we how to
                      use that, maybe I miss something in<br>
                      &gt;&gt;&gt;&gt;&gt; previous<br>
                      &gt;&gt;&gt;&gt;&gt; discussing thread.<br>
                      &gt;&gt;&gt;&gt; In QueueSubmit(), we start by
                      reading the sideband payloads :<br>
                      &gt;&gt;&gt;&gt; <a
href="https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L655"
                        target="_blank" moz-do-not-send="true">
https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L655</a><br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; Then build everything for the
                      submission and hand it over to the<br>
                      &gt;&gt;&gt;&gt; submission thread.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; Instead of the just waiting on
                      the timeline semaphore values, we also<br>
                      &gt;&gt;&gt;&gt; wait on the binary semaphore
                      sideband payload values.<br>
                      &gt;&gt;&gt; Waiting on timeline values is when
                      finding fence in kernel.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Hmm aren't you waiting in a thread in
                      userspace?<br>
                      &gt; Yes, For timeline case, we can use
                      waitForSyncobj()..., At begin of<br>
                      &gt; QueueThread, I let it wait in cs_ioctl when
                      drm_syncobj_find_fence.<br>
                      &gt;<br>
                      &gt; But I still didn't get how to wait on
                      sideband for binary Syncobj.<br>
                      &gt;<br>
                      &gt; Ah, I see, you will compare it in your
                      QueueThread, if sideband value is<br>
                      &gt;   &gt;= expected, then do submission,
                      otherwise, loop QueueThread, right?<br>
                      <br>
                      <br>
                      Just treat binary semaphores as timelines and
                      waitForSyncobj on the <br>
                      sideband payload value.<br>
                      <br>
                      It should make the submission thread any busier
                      than currently.<br>
                      <br>
                      <br>
                      -Lionel<br>
                      <br>
                      <br>
                      &gt;<br>
                      &gt; That sounds the QueueThread will be always
                      busy.<br>
                      &gt;<br>
                      &gt; -David<br>
                      &gt;<br>
                      &gt;<br>
                      &gt;&gt;<br>
                      &gt;&gt;&gt; But I don't see how to wait/block in
                      kernel when finding fence for<br>
                      &gt;&gt;&gt; binary sideband payload  values.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Essentially our driver now handles
                      timelines &amp; binary semaphore using<br>
                      &gt;&gt; dma-fence-chain in both cases.<br>
                      &gt;<br>
                      &gt;<br>
                      &gt;&gt; Only with timelines we take the values
                      submitted by the vulkan<br>
                      &gt;&gt; application.<br>
                      &gt;<br>
                      &gt;&gt; The binary semaphore auto increment on
                      vkQueueSubmit() and that is<br>
                      &gt;&gt; managed by the userspace driver.<br>
                      &gt;&gt;<br>
                      &gt;&gt;<br>
                      &gt;&gt; -Lionel<br>
                      &gt;&gt;<br>
                      &gt;&gt;<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; -David<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; Finally before exiting the
                      QueueSubmit() call, we bump the sideband<br>
                      &gt;&gt;&gt;&gt; payloads of all the binary
                      semaphores have have been signaled :<br>
                      &gt;&gt;&gt;&gt; <a
href="https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L806"
                        target="_blank" moz-do-not-send="true">
https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L806</a><br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; Whoever calls QueueSubmit() after
                      that will pickup the new sideband<br>
                      &gt;&gt;&gt;&gt; payload values to wait on.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; -Lionel<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt; -DAvid<br>
                      &gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt; 在 2019/8/8 21:38, Lionel
                      Landwerlin 写道:<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; Interesting question :)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; I didn't see any usecase
                      for that.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; This sideband payload
                      value is used for a wait so waiting on the wait<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; value for another wait is
                      bit meta :)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; Do you have a use case
                      for that?<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; -Lionel<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt; On 08/08/2019 16:23,
                      Chunming Zhou wrote:<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt; The propursal is fine
                      with me.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt; one question:<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt; how to wait sideband
                      payload? Following patch will show that?<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt; -David<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt; 在 2019/8/8 21:14,
                      Lionel Landwerlin 写道:<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The Vulkan
                      timeline semaphores allow signaling to happen on
                      the<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; point<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of the timeline
                      without all of the its dependencies to be created.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The current 2
                      implementations (AMD/Intel) of the Vulkan spec on<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; top of<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the Linux kernel
                      are using a thread to wait on the dependencies<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of a<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; given point to
                      materialize and delay actual submission to the<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; kernel<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; driver until the
                      wait completes.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; If a binary
                      semaphore is submitted for signaling along the
                      side<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of a<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; timeline
                      semaphore waiting for completion that means that
                      the drm<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; syncobj
                      associated with that binary semaphore will not
                      have a DMA<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence associated
                      with it by the time vkQueueSubmit() returns. This<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the fact that a
                      binary semaphore can be signaled and unsignaled as<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; before its DMA
                      fences materialize mean that we cannot just rely
                      on<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence within the
                      syncobj but we also need a sideband payload<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; verifying<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; that the fence in
                      the syncobj matches the last submission from the<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Vulkan API point
                      of view.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; This change adds
                      a sideband payload that is incremented with<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; signaled<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; syncobj when
                      vkQueueSubmit() is called. The next
                      vkQueueSubmit()<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; waiting on a the
                      syncobj will read the sideband payload and wait<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for a<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence chain
                      element with a seqno superior or equal to the
                      sideband<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; payload value to
                      be added into the fence chain and use that<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence to<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; trigger the
                      submission on the kernel driver.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; v2: Use a
                      separate ioctl to get/set the sideband value
                      (Christian)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; v3: Use 2 ioctls
                      for get/set (Christian)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by:
                      Lionel Landwerlin <a
                        class="gmail-m_7409227408945320520moz-txt-link-rfc2396E"
                        href="mailto:lionel.g.landwerlin@intel.com"
                        target="_blank" moz-do-not-send="true">
                        &lt;lionel.g.landwerlin@intel.com&gt;</a><br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: Christian
                      Koenig <a
                        class="gmail-m_7409227408945320520moz-txt-link-rfc2396E"
                        href="mailto:Christian.Koenig@amd.com"
                        target="_blank" moz-do-not-send="true">
                        &lt;Christian.Koenig@amd.com&gt;</a><br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: Jason
                      Ekstrand <a
                        class="gmail-m_7409227408945320520moz-txt-link-rfc2396E"
                        href="mailto:jason@jlekstrand.net"
                        target="_blank" moz-do-not-send="true">
                        &lt;jason@jlekstrand.net&gt;</a><br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc:
                      David(ChunMing) Zhou <a
                        class="gmail-m_7409227408945320520moz-txt-link-rfc2396E"
                        href="mailto:David1.Zhou@amd.com"
                        target="_blank" moz-do-not-send="true">
                        &lt;David1.Zhou@amd.com&gt;</a><br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;      
                      drivers/gpu/drm/drm_internal.h |  4 ++<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;      
                      drivers/gpu/drm/drm_ioctl.c    |  5 +++<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;      
                      drivers/gpu/drm/drm_syncobj.c  | 79<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +++++++++++++++++++++++++++++++++-<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;      
                      include/drm/drm_syncobj.h      |  9 ++++<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;      
                      include/uapi/drm/drm.h         |  2 +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       5 files
                      changed, 98 insertions(+), 1 deletion(-)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
                      a/drivers/gpu/drm/drm_internal.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      b/drivers/gpu/drm/drm_internal.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index
                      51a2055c8f18..0c9736199df0 100644<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
                      a/drivers/gpu/drm/drm_internal.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
                      b/drivers/gpu/drm/drm_internal.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -208,6 +208,10
                      @@ int drm_syncobj_timeline_signal_ioctl(struct<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_device *dev,
                      void *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 
                                                 struct drm_file
                      *file_private);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       int
                      drm_syncobj_query_ioctl(struct drm_device *dev,
                      void<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 
                                           struct drm_file
                      *file_private);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int
                      drm_syncobj_get_sideband_ioctl(struct drm_device
                      *dev, void<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                   struct drm_file
                      *file_private);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int
                      drm_syncobj_set_sideband_ioctl(struct drm_device
                      *dev, void<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                   struct drm_file
                      *file_private);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          /*
                      drm_framebuffer.c */<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       void
                      drm_framebuffer_print_info(struct drm_printer *p,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; unsigned<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; int indent,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
                      a/drivers/gpu/drm/drm_ioctl.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      b/drivers/gpu/drm/drm_ioctl.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index
                      f675a3bb2c88..48500bf62801 100644<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
                      a/drivers/gpu/drm/drm_ioctl.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
                      b/drivers/gpu/drm/drm_ioctl.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -703,6 +703,11
                      @@ static const struct drm_ioctl_desc<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_ioctls[]<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; = {<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 
                                         DRM_RENDER_ALLOW),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          
                      DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_query_ioctl,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 
                                         DRM_RENDER_ALLOW),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +   
                      DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_GET_SIDEBAND,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_get_sideband_ioctl,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +             
                      DRM_RENDER_ALLOW),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +   
                      DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_SET_SIDEBAND,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_set_sideband_ioctl,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +             
                      DRM_RENDER_ALLOW),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          
                      DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_crtc_get_sequence_ioctl, 0),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          
                      DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_crtc_queue_sequence_ioctl, 0),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          
                      DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_mode_create_lease_ioctl, DRM_MASTER),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
                      a/drivers/gpu/drm/drm_syncobj.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      b/drivers/gpu/drm/drm_syncobj.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index
                      b927e482e554..c90ef20b9242 100644<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
                      a/drivers/gpu/drm/drm_syncobj.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
                      b/drivers/gpu/drm/drm_syncobj.c<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -1150,8
                      +1150,10 @@ drm_syncobj_reset_ioctl(struct
                      drm_device<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *dev, void *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;           if (ret
                      &lt; 0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;              
                      return ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       -    for (i
                      = 0; i &lt; args-&gt;count_handles; i++)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    for (i = 0;
                      i &lt; args-&gt;count_handles; i++) {<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;              
                      drm_syncobj_replace_fence(syncobjs[i], NULL);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +       
                      syncobjs[i]-&gt;sideband_payload = 0;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    }<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;             
                      drm_syncobj_array_free(syncobjs,
                      args-&gt;count_handles);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       @@ -1321,6
                      +1323,81 @@ int drm_syncobj_query_ioctl(struct<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_device *dev,
                      void *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;               if
                      (ret)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                  
                      break;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;           }<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +   
                      drm_syncobj_array_free(syncobjs,
                      args-&gt;count_handles);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    return ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int
                      drm_syncobj_get_sideband_ioctl(struct drm_device
                      *dev, void<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                   struct drm_file *file_private)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    struct
                      drm_syncobj_timeline_array *args = data;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    struct
                      drm_syncobj **syncobjs;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    uint64_t
                      __user *points = u64_to_user_ptr(args-&gt;points);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    uint32_t i;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    int ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if
                      (!drm_core_check_feature(dev,
                      DRIVER_SYNCOBJ_TIMELINE))<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      -EOPNOTSUPP;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if
                      (args-&gt;pad != 0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      -EINVAL;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if
                      (args-&gt;count_handles == 0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      -EINVAL;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    ret =
                      drm_syncobj_array_find(file_private,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +
                      u64_to_user_ptr(args-&gt;handles),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                     args-&gt;count_handles,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                     &amp;syncobjs);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if (ret &lt;
                      0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    for (i = 0;
                      i &lt; args-&gt;count_handles; i++) {<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +       
                      copy_to_user(&amp;points[i],
                      &amp;syncobjs[i]-&gt;sideband_payload,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      sizeof(uint64_t));<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        ret =
                      ret ? -EFAULT : 0;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        if (ret)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +           
                      break;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    }<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +   
                      drm_syncobj_array_free(syncobjs,
                      args-&gt;count_handles);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    return ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int
                      drm_syncobj_set_sideband_ioctl(struct drm_device
                      *dev, void<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                   struct drm_file *file_private)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    struct
                      drm_syncobj_timeline_array *args = data;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    struct
                      drm_syncobj **syncobjs;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    uint64_t
                      __user *points = u64_to_user_ptr(args-&gt;points);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    uint32_t i;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    int ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if
                      (!drm_core_check_feature(dev,
                      DRIVER_SYNCOBJ_TIMELINE))<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      -EOPNOTSUPP;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if
                      (args-&gt;pad != 0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      -EINVAL;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if
                      (args-&gt;count_handles == 0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      -EINVAL;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    ret =
                      drm_syncobj_array_find(file_private,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +
                      u64_to_user_ptr(args-&gt;handles),<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                     args-&gt;count_handles,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      +                     &amp;syncobjs);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    if (ret &lt;
                      0)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        return
                      ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    for (i = 0;
                      i &lt; args-&gt;count_handles; i++) {<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +
                      copy_from_user(&amp;syncobjs[i]-&gt;sideband_payload,
                      &amp;points[i],<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      sizeof(uint64_t));<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        ret =
                      ret ? -EFAULT : 0;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +        if (ret)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +           
                      break;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    }<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          
                      drm_syncobj_array_free(syncobjs,
                      args-&gt;count_handles);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;             
                      return ret;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
                      a/include/drm/drm_syncobj.h
                      b/include/drm/drm_syncobj.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index
                      6cf7243a1dc5..b587b8e07547 100644<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
                      a/include/drm/drm_syncobj.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
                      b/include/drm/drm_syncobj.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -61,6 +61,15
                      @@ struct drm_syncobj {<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            *
                      @file: A file backing for this syncobj.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            */<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;           struct
                      file *file;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    /**<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     *
                      @sideband_payload: A 64bit side band payload.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     *<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     * We use
                      the sideband payload value to wait on binary
                      syncobj<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fences<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     * to
                      materialize. It is a reservation mechanism for the<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; signaler to<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     * express
                      that at some point in the future a dma fence with<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the same<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     * seqno
                      will be put into the syncobj.<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +     */<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +    u64
                      sideband_payload;<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       };<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          void
                      drm_syncobj_free(struct kref *kref);<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
                      a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index
                      8a5b2f8f8eb9..cffdc6c9772c 100644<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
                      a/include/uapi/drm/drm.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
                      b/include/uapi/drm/drm.h<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -946,6 +946,8
                      @@ extern "C" {<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       #define
                      DRM_IOCTL_SYNCOBJ_QUERY DRM_IOWR(0xCB, struct<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_timeline_array)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       #define
                      DRM_IOCTL_SYNCOBJ_TRANSFER DRM_IOWR(0xCC, struct<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_transfer)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       #define
                      DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL DRM_IOWR(0xCD,<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; struct
                      drm_syncobj_timeline_array)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define
                      DRM_IOCTL_SYNCOBJ_GET_SIDEBAND DRM_IOR(0xCE,
                      struct<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_timeline_array)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define
                      DRM_IOCTL_SYNCOBJ_SET_SIDEBAND DRM_IOWR(0xCF,
                      struct<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                      drm_syncobj_timeline_array)<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;          /**<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;        * Device
                      specific ioctls should only be in their respective<br>
                      &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; headers<br>
                      &gt;&gt;<br>
                      <br>
                    </div>
                  </span></font></blockquote>
              <br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------968383C906EF7863FC53AB05--

--===============0703115211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0703115211==--
